import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';

part 'today_orders_cubit.freezed.dart';

@freezed
sealed class TodayOrdersState with _$TodayOrdersState {
  const factory TodayOrdersState.loading({@Default('') String search}) =
      TodayOrdersLoading;

  /// The [orders] of the first [pages] pages, of [total] today, newest
  /// first.
  const factory TodayOrdersState.ready({
    required String search,
    required List<OrderSummary> orders,
    required int total,
    @Default(1) int pages,
    @Default(false) bool loadingMore,

    /// Why the next page didn't load.
    ApiException? moreError,
  }) = TodayOrdersReady;

  const factory TodayOrdersState.failed({
    required String search,
    required ApiException error,
  }) = TodayOrdersFailed;
}

/// Whether today has orders past the pages loaded. It counts pages, not the
/// orders shown: an order made meanwhile is on the first page, which a
/// reload brings, so the shown ones may never reach the total.
bool hasMoreOrders(TodayOrdersReady state) =>
    state.pages * PosRepository.pageSize < state.total;

/// The outlet's orders today, in its time zone, voided ones included: to
/// find a receipt by part of its number, look at it again, or void it.
class TodayOrdersCubit extends Cubit<TodayOrdersState> {
  TodayOrdersCubit(this._pos) : super(const TodayOrdersState.loading());

  final PosRepository _pos;

  /// Counts the loads begun, so an answer to an older search is dropped.
  int _generation = 0;

  /// Loads the first page of the orders whose receipt number holds
  /// [search].
  Future<void> load([String search = '']) async {
    final generation = ++_generation;
    emit(TodayOrdersState.loading(search: search));
    try {
      final page = await _pos.todayOrders(search: search);
      if (isClosed || generation != _generation) return;
      emit(
        TodayOrdersState.ready(
          search: search,
          orders: page.orders,
          total: page.total,
        ),
      );
    } on ApiException catch (error) {
      if (isClosed || generation != _generation) return;
      emit(TodayOrdersState.failed(search: search, error: error));
    }
  }

  /// Loads the first page again, for the same search: after an order was
  /// voided, say.
  Future<void> reload() => load(state.search);

  /// Loads the next page. Orders made meanwhile push the list down, so one
  /// already shown can come again: it is shown once.
  Future<void> loadMore() async {
    final current = state;
    if (current is! TodayOrdersReady ||
        current.loadingMore ||
        !hasMoreOrders(current)) {
      return;
    }
    final generation = _generation;
    emit(current.copyWith(loadingMore: true, moreError: null));
    try {
      final page = await _pos.todayOrders(
        search: current.search,
        page: current.pages + 1,
      );
      if (isClosed || generation != _generation) return;
      final shown = {for (final o in current.orders) o.orderId};
      emit(
        current.copyWith(
          orders: [
            ...current.orders,
            for (final o in page.orders)
              if (!shown.contains(o.orderId)) o,
          ],
          total: page.total,
          pages: current.pages + 1,
          loadingMore: false,
        ),
      );
    } on ApiException catch (error) {
      if (isClosed || generation != _generation) return;
      emit(current.copyWith(moreError: error));
    }
  }
}
