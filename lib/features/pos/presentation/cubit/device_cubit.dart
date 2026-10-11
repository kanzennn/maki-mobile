import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';

part 'device_cubit.freezed.dart';

@freezed
sealed class DeviceState with _$DeviceState {
  const factory DeviceState.loading() = DeviceLoading;

  /// One of the outlet's devices in use: it can sell.
  const factory DeviceState.ready(TillDevice device) = DeviceReady;

  /// A phone the outlet hasn't activated: its Manager, signed in on it,
  /// activates it. [error] is why the last activation failed.
  const factory DeviceState.unregistered({
    @Default(false) bool activating,
    ApiException? error,
  }) = DeviceUnregistered;

  /// The device couldn't be checked at all, such as without a connection.
  const factory DeviceState.failed(ApiException error) = DeviceFailed;
}

/// This phone as one of the outlet's cashier devices: whether it may sell,
/// and the count its next receipt number takes. It is checked when the
/// cashier opens, after each sale, and when the app comes back to the
/// front. A revoked device never stays here: the API client ends the
/// session that learns of it.
class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit(this._pos) : super(const DeviceState.loading());

  final PosRepository _pos;

  /// Checks the device, showing that it does.
  Future<void> load() async {
    emit(const DeviceState.loading());
    await _check(keepOnFailure: false);
  }

  /// Checks the device again; failing to, keeps what is known. An
  /// activation on its way answers for itself.
  Future<void> refresh() async {
    if (state case DeviceUnregistered(activating: true)) return;
    await _check(keepOnFailure: true);
  }

  /// Activates this phone under [name], as the outlet's Manager.
  Future<void> activate(String name) async {
    if (state case DeviceUnregistered(activating: false)) {
      emit(const DeviceState.unregistered(activating: true));
      try {
        await _pos.activate(name);
      } on ApiException catch (error) {
        if (isClosed) return;
        // Already one of the outlet's devices in use: it can sell.
        if (error.code != 'device_already_active') {
          emit(DeviceState.unregistered(error: error));
          return;
        }
      }
      if (isClosed) return;
      // Activated: the token is kept, so a failure from here on is the
      // check's, and trying again checks rather than activating twice.
      await _check(keepOnFailure: false);
    }
  }

  /// A sale took [orderNo]: the next number moves past it at once, while
  /// the server is asked for the count.
  void sold(String orderNo) {
    if (state case DeviceReady(:final device)) {
      emit(DeviceState.ready(afterSale(device, orderNo)));
    }
    unawaited(refresh());
  }

  Future<void> _check({required bool keepOnFailure}) async {
    try {
      final device = await _pos.device();
      if (!isClosed) emit(DeviceState.ready(device));
    } on ApiException catch (error) {
      if (isClosed) return;
      if (error.code == 'device_not_registered' ||
          error.code == 'device_revoked') {
        emit(const DeviceState.unregistered());
      } else if (!keepOnFailure || state is DeviceLoading) {
        emit(DeviceState.failed(error));
      }
    }
  }
}
