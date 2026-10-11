import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';

part 'order_cubit.freezed.dart';

@freezed
sealed class OrderState with _$OrderState {
  const factory OrderState.loading() = OrderLoading;

  /// The order; [voiding] while its void is on its way, and [voidError]
  /// when the last one was refused.
  const factory OrderState.ready(
    Order order, {
    @Default(false) bool voiding,
    ApiException? voidError,
  }) = OrderReady;

  const factory OrderState.failed(ApiException error) = OrderFailed;
}

/// One of today's orders: its receipt, and its void.
class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._pos, this.orderId) : super(const OrderState.loading());

  final PosRepository _pos;
  final String orderId;

  Future<void> load() async {
    emit(const OrderState.loading());
    try {
      final order = await _pos.order(orderId);
      if (!isClosed) emit(OrderState.ready(order));
    } on ApiException catch (error) {
      if (!isClosed) emit(OrderState.failed(error));
    }
  }

  /// Voids the order, for [reason]: its payment is cancelled and its stock
  /// comes back. One already voided by someone else meanwhile loads again,
  /// as it is now.
  Future<void> voidOrder(String reason) async {
    final current = state;
    if (current is! OrderReady ||
        current.voiding ||
        current.order.status == OrderStatus.voided) {
      return;
    }
    emit(current.copyWith(voiding: true, voidError: null));
    try {
      final voided = await _pos.voidOrder(orderId, reason);
      if (!isClosed) emit(OrderState.ready(voided));
    } on ApiException catch (error) {
      if (isClosed) return;
      if (error.code == 'order_already_void') {
        try {
          final now = await _pos.order(orderId);
          if (!isClosed) emit(OrderState.ready(now, voidError: error));
          return;
        } on ApiException {
          // Shown as the void's own error below.
        }
        if (isClosed) return;
      }
      emit(current.copyWith(voiding: false, voidError: error));
    }
  }
}
