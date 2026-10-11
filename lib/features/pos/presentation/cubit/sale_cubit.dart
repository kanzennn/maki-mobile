import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart' as cart;
import 'package:maki_mobile/features/pos/domain/cart.dart' show CartLine;
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/domain/stand.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';

part 'sale_cubit.freezed.dart';

/// The order being rung up, and its sale.
@freezed
abstract class SaleState with _$SaleState {
  const factory SaleState({
    @Default(OrderType.dineIn) OrderType type,
    @Default(<CartLine>[]) List<CartLine> lines,

    /// The voucher the customer gave, one per order, as the server checked
    /// it: its discount is worked out again from its terms as the cart
    /// changes.
    Voucher? voucher,

    /// A code is being checked.
    @Default(false) bool checkingVoucher,

    /// Why the code just typed was refused, until the next try.
    ApiException? voucherError,

    /// The table a dine-in order is for, if the cashier picked one: always
    /// optional, and never a takeaway's.
    OrderTable? table,

    /// The number on the stand a dine-in customer took, as the cashier
    /// types it, where the outlet seats its customers by number stands;
    /// empty for none, and always a takeaway's.
    @Default('') String standNumber,

    /// The order on its way, or sent without an answer: it may have been
    /// taken, so it is sent again exactly as it was, and the cart can't
    /// change until it is settled.
    NewOrder? pending,

    /// The order is on its way.
    @Default(false) bool sending,

    /// What the cashier is told: what following the catalog changed in the
    /// order, or why a sale was refused. Kept until dismissed.
    @Default(<SaleNotice>[]) List<SaleNotice> notices,

    /// The sale just taken, until the cashier turns to the next customer:
    /// its receipt and its change.
    Order? sold,

    /// The last refusal: what it names loads again.
    ApiException? refused,
  }) = _SaleState;

  const SaleState._();

  /// Sent, and no answer came: the cashier sends it again or lets it go.
  bool get unanswered => pending != null && !sending;
}

/// Something the cashier should hear about the order.
@freezed
sealed class SaleNotice with _$SaleNotice {
  /// Menus no longer on sale, or sold out, taken out of the order.
  const factory SaleNotice.unavailable(List<String> names) = UnavailableNotice;

  /// Menus with less stock than ordered, cut to what there is.
  const factory SaleNotice.stockCut(List<String> names) = StockCutNotice;

  /// Menus whose price changed since the catalog loaded.
  const factory SaleNotice.pricesChanged(List<String> names) =
      PricesChangedNotice;

  /// The outlet's tax or service charge changed.
  const factory SaleNotice.totalChanged() = TotalChangedNotice;

  /// The outlet no longer takes the payment method.
  const factory SaleNotice.methodUnavailable() = MethodUnavailableNotice;

  /// Check the order and its total, then charge again.
  const factory SaleNotice.check() = CheckNotice;

  /// The phone's clock is far off: the server refused when the order was
  /// made.
  const factory SaleNotice.clock() = ClockNotice;

  /// A sale let go of without an answer: today's orders say whether it was
  /// taken.
  const factory SaleNotice.abandoned() = AbandonedNotice;

  /// A voucher the sale couldn't take, taken off the order: its code, and
  /// why.
  const factory SaleNotice.voucherRemoved(String code, ApiException error) =
      VoucherRemovedNotice;

  /// A table the sale couldn't be at — turned off, scheduled off or deleted
  /// since it was picked — taken off the order: its name, and why.
  const factory SaleNotice.tableRemoved(String name, ApiException error) =
      TableRemovedNotice;

  /// The outlet now seats its customers by number stands: the table picked
  /// came off the order, and the stand's number is wanted instead.
  const factory SaleNotice.tableDropped(String name) = TableDroppedNotice;

  /// The outlet now seats its customers at tables: the stand's number came
  /// off the order.
  const factory SaleNotice.standDropped(String number) = StandDroppedNotice;

  /// The outlet now seats its customers by number stands: the stand's
  /// number is wanted.
  const factory SaleNotice.nowNumber() = NowNumberNotice;

  /// Any other refusal, said as its error.
  const factory SaleNotice.error(ApiException error) = ErrorNotice;
}

/// The order being rung up, and charging it without charging twice. An
/// order is built once, with its own ID, and sent: a resend of the same
/// order is answered with it as it was taken, never a second one. While no
/// answer has come it stays pending, and the cart can't change.
///
/// - No answer, or a 5xx: sent again by itself as many times as
///   [resendDelays] has waits, then by the cashier ([resend]), always
///   exactly as it was.
/// - `order_no_taken`: renumbered from `GET /pos/device` and sent again,
///   with its ID kept. The refusal proves no order has it.
/// - A voucher's refusal (`voucher_used_up`, …): the voucher comes off the
///   order, and the notices say why.
/// - `table_unavailable`: the table comes off the order, and the notices
///   say why.
/// - `dine_in_mode_changed`: the table, or the stand's number, the outlet's
///   way of seating its customers now has no place for comes off the
///   order, and the notices say so.
/// - Any other refusal: [SaleState.refused] names it, so what it names
///   loads again, and the notices say what changed. A `total_changed` with
///   a voucher checks the voucher's terms again too.
///
/// Prices are never kept: they are the catalog's, and the cart follows the
/// catalog as it loads ([follow]).
class SaleCubit extends Cubit<SaleState> {
  SaleCubit(
    this._pos, {
    this.resendDelays = const [Duration(seconds: 1), Duration(seconds: 3)],
    this._now = DateTime.now,
  }) : super(const SaleState());

  final PosRepository _pos;

  /// The waits before each automatic resend of an order with no answer.
  final List<Duration> resendDelays;
  final DateTime Function() _now;

  /// The outlet's time zone, from the catalog the order was charged with:
  /// a renumbered order keeps its own day there.
  String _timeZone = 'UTC';

  /// The catalog the order was charged with, for checking its voucher
  /// again.
  Catalog? _catalog;

  /// How many times an order is renumbered when its number turns out taken.
  static const _renumbers = 2;

  void add(CatalogMenu menu) => _change((lines) => cart.addOne(lines, menu));

  void setQty(CatalogMenu menu, int qty) =>
      _change((lines) => cart.setQty(lines, menu, qty));

  void setNote(String menuId, String note) =>
      _change((lines) => cart.setNote(lines, menuId, note));

  void remove(String menuId) =>
      _change((lines) => cart.removeLine(lines, menuId));

  /// Checks the code the customer gave, on the cart's subtotal at the
  /// [catalog]'s prices: its terms then follow the cart. A refusal stays in
  /// [SaleState.voucherError] until the next try.
  Future<void> applyVoucher(String code, Catalog catalog) async {
    final typed = code.trim();
    if (typed.isEmpty || state.pending != null || state.checkingVoucher) {
      return;
    }
    emit(state.copyWith(checkingVoucher: true, voucherError: null));
    try {
      final subtotal = priced(state.lines, catalog).totals.subtotal;
      final voucher = await _pos.validateVoucher(typed, subtotal);
      if (!isClosed) {
        emit(state.copyWith(voucher: voucher, checkingVoucher: false));
      }
    } on ApiException catch (error) {
      if (!isClosed) {
        emit(state.copyWith(checkingVoucher: false, voucherError: error));
      }
    }
  }

  /// Takes the voucher off the order.
  void removeVoucher() {
    if (state.pending == null) {
      emit(state.copyWith(voucher: null, voucherError: null));
    }
  }

  /// Dine-in or takeaway. A takeaway has no table, nor a stand: it lets go
  /// of them.
  void setType(OrderType type) {
    if (state.pending != null) return;
    final takeaway = type == OrderType.takeaway;
    emit(
      state.copyWith(
        type: type,
        table: takeaway ? null : state.table,
        standNumber: takeaway ? '' : state.standNumber,
      ),
    );
  }

  /// The dine-in order's table, or none.
  void setTable(OrderTable? table) {
    if (state.pending == null) emit(state.copyWith(table: table));
  }

  /// The number on the dine-in customer's stand, as typed.
  void setStandNumber(String typed) {
    if (state.pending == null) emit(state.copyWith(standNumber: typed));
  }

  /// The order against the catalog as it has just loaded: a menu no longer
  /// on sale, or with none left, comes out, one with less stock than
  /// ordered is cut to it, a table picked or a stand's number typed that
  /// the outlet's way of seating its customers has no place for comes off,
  /// and the notices say so. An order on its way stays as it was sent.
  void follow(Catalog catalog) {
    if (state.pending != null) return;
    final result = cart.reconcile(state.lines, catalog.menusById);
    final byStand = catalog.dineInMode == DineInMode.number;
    final strayTable = byStand ? state.table : null;
    final strayStand = !byStand && state.standNumber.isNotEmpty
        ? standNumber(state.standNumber)
        : null;
    if (result.removed.isEmpty &&
        result.reduced.isEmpty &&
        strayTable == null &&
        strayStand == null) {
      return;
    }
    emit(
      state.copyWith(
        lines: result.lines,
        table: strayTable == null ? state.table : null,
        standNumber: strayStand == null ? state.standNumber : '',
        notices: _merged([
          if (result.removed.isNotEmpty)
            SaleNotice.unavailable([for (final l in result.removed) l.name]),
          if (result.reduced.isNotEmpty)
            SaleNotice.stockCut([for (final l in result.reduced) l.name]),
          if (strayTable != null) SaleNotice.tableDropped(strayTable.name),
          if (strayStand != null && strayStand.isNotEmpty)
            SaleNotice.standDropped(strayStand),
        ], state.notices),
      ),
    );
  }

  void dismissNotices() => emit(state.copyWith(notices: const []));

  /// Charges the cart in cash: [received] handed over, at the [catalog]'s
  /// prices and rates, numbered by [device]. Where the outlet seats its
  /// customers by number stands, a dine-in order needs its stand's number.
  /// A second tap while it is on its way does nothing.
  Future<void> pay({
    required Catalog catalog,
    required TillDevice device,
    required int received,
  }) async {
    if (state.pending != null || state.lines.isEmpty) return;
    final sale = priced(state.lines, catalog, voucher: state.voucher);
    if (sale.lines.isEmpty || !sale.voucherApplies) return;
    if (received < sale.totals.total) return;
    final byStand =
        state.type == OrderType.dineIn &&
        catalog.dineInMode == DineInMode.number;
    if (byStand && !validStand(state.standNumber)) return;
    _timeZone = catalog.outlet.timeZone;
    _catalog = catalog;
    await _settle(
      makeOrder(
        type: state.type,
        lines: sale.lines,
        total: sale.totals.total,
        received: received,
        device: device,
        at: _now(),
        timeZone: _timeZone,
        voucherCode: state.voucher?.code,
        tableId: state.table?.tableId,
        standNumber: byStand ? standNumber(state.standNumber) : null,
      ),
    );
  }

  /// Sends the order that got no answer again, exactly as it was.
  Future<void> resend() async {
    final order = state.pending;
    if (order == null || state.sending) return;
    await _settle(order);
  }

  /// Lets go of the order that got no answer, so the cart can change again.
  /// It may have been taken: the notice says to look at today's orders
  /// before charging again.
  void abandon() {
    if (!state.unanswered) return;
    emit(
      state.copyWith(
        pending: null,
        notices: _merged(const [SaleNotice.abandoned()], state.notices),
      ),
    );
  }

  /// The receipt has been seen: on to the next customer.
  void nextCustomer() => emit(state.copyWith(sold: null));

  void _change(List<CartLine> Function(List<CartLine> lines) update) {
    if (state.pending == null) emit(state.copyWith(lines: update(state.lines)));
  }

  Future<void> _settle(NewOrder first) async {
    var order = first;
    for (var renumbered = 0; ; renumbered++) {
      emit(state.copyWith(pending: order, sending: true, refused: null));
      final outcome = await _send(order);
      if (isClosed) return;
      switch (outcome) {
        case _Sold(:final taken):
          // A new customer: an empty cart, and the receipt of this one.
          emit(SaleState(sold: taken));
          return;
        case _Unanswered():
          emit(state.copyWith(sending: false));
          return;
        case _Refused(:final error)
            when error.code == 'order_no_taken' && renumbered < _renumbers:
          try {
            order = renumber(order, await _pos.device(), _timeZone);
          } on ApiException catch (deviceError) {
            if (!isClosed) _refuse(deviceError);
            return;
          }
          if (isClosed) return;
        case _Refused(:final error):
          _refuse(error);
          return;
      }
    }
  }

  Future<_Outcome> _send(NewOrder order) async {
    for (var attempt = 0; ; attempt++) {
      try {
        return _Sold(await _pos.createOrder(order));
      } on ApiException catch (error) {
        if (_settles(error)) return _Refused(error);
        if (attempt >= resendDelays.length) return const _Unanswered();
        await Future<void>.delayed(resendDelays[attempt]);
        if (isClosed) return const _Unanswered();
      }
    }
  }

  /// A refusal proves nothing was taken under the order's ID, so the cart
  /// is free again. A voucher or a table the sale can't take comes off it,
  /// and so does the table or the stand's number the outlet's way of
  /// seating its customers now has no place for.
  void _refuse(ApiException error) {
    final voucher = state.voucher;
    final table = state.table;
    final mode = error.code == 'dine_in_mode_changed'
        ? error.details['mode']
        : null;
    if (mode == 'number') {
      emit(
        state.copyWith(
          pending: null,
          sending: false,
          refused: error,
          table: null,
          notices: [
            if (table != null)
              SaleNotice.tableDropped(table.name)
            else
              const SaleNotice.nowNumber(),
          ],
        ),
      );
      return;
    }
    if (mode == 'table' && state.standNumber.isNotEmpty) {
      emit(
        state.copyWith(
          pending: null,
          sending: false,
          refused: error,
          standNumber: '',
          notices: [SaleNotice.standDropped(standNumber(state.standNumber))],
        ),
      );
      return;
    }
    if (error.code == 'table_unavailable' && table != null) {
      emit(
        state.copyWith(
          pending: null,
          sending: false,
          refused: error,
          table: null,
          notices: [SaleNotice.tableRemoved(table.name, error)],
        ),
      );
      return;
    }
    if (error.code.startsWith('voucher_') && voucher != null) {
      emit(
        state.copyWith(
          pending: null,
          sending: false,
          refused: error,
          voucher: null,
          notices: [SaleNotice.voucherRemoved(voucher.code, error)],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        pending: null,
        sending: false,
        refused: error,
        notices: _noticesFor(error),
      ),
    );
    if (error.code == 'total_changed' && voucher != null) {
      unawaited(_recheckVoucher(voucher.code));
    }
  }

  /// The voucher's terms again, after the server's total wasn't the
  /// cashier's: they may have changed since the code was checked. One the
  /// sale can't take any more comes off, and the notices say why.
  Future<void> _recheckVoucher(String code) async {
    final catalog = _catalog;
    if (catalog == null) return;
    try {
      final subtotal = priced(state.lines, catalog).totals.subtotal;
      final voucher = await _pos.validateVoucher(code, subtotal);
      if (!isClosed && state.voucher?.code == code) {
        emit(state.copyWith(voucher: voucher));
      }
    } on ApiException catch (error) {
      if (!isClosed && state.voucher?.code == code) {
        emit(
          state.copyWith(
            voucher: null,
            notices: _merged([
              SaleNotice.voucherRemoved(code, error),
            ], state.notices),
          ),
        );
      }
    }
  }

  /// What a refusal tells the cashier; loading what it names again says
  /// the rest.
  List<SaleNotice> _noticesFor(ApiException error) {
    switch (error.code) {
      case 'prices_changed':
        final names = {for (final l in state.lines) l.menuId: l.name};
        return [
          SaleNotice.pricesChanged([
            for (final id in _menuIds(error)) names[id] ?? id,
          ]),
          const SaleNotice.check(),
        ];
      case 'total_changed':
        return const [SaleNotice.totalChanged(), SaleNotice.check()];
      case 'payment_method_unavailable':
        return const [SaleNotice.methodUnavailable()];
      case 'menu_unavailable' || 'order_stock_insufficient':
        return const [SaleNotice.check()];
      case 'validation_failed'
          when _fields(error).containsKey('client_created_at'):
        return const [SaleNotice.clock()];
      default:
        return [SaleNotice.error(error)];
    }
  }
}

/// An answer that settles an order: anything below a 5xx. No answer, or a
/// 5xx, may have come after the server took it.
bool _settles(ApiException error) =>
    error.statusCode != null && error.statusCode! < 500;

/// The menus a refusal names (`details.menus`).
List<String> _menuIds(ApiException error) => [
  if (error.details['menus'] case final List<dynamic> menus)
    for (final menu in menus)
      if (menu case {'menu_id': final String id}) id,
];

/// The fields a validation error names (`details.fields`).
Map<String, dynamic> _fields(ApiException error) =>
    switch (error.details['fields']) {
      final Map<String, dynamic> fields => fields,
      _ => const {},
    };

/// [first], then those of [rest] it doesn't say already.
List<SaleNotice> _merged(List<SaleNotice> first, List<SaleNotice> rest) => [
  ...first,
  for (final notice in rest)
    if (!first.contains(notice)) notice,
];

sealed class _Outcome {
  const _Outcome();
}

/// Taken: the order as the server saved it.
class _Sold extends _Outcome {
  const _Sold(this.taken);
  final Order taken;
}

/// Refused, so not taken.
class _Refused extends _Outcome {
  const _Refused(this.error);
  final ApiException error;
}

/// No answer, or a server error: it may have been taken.
class _Unanswered extends _Outcome {
  const _Unanswered();
}
