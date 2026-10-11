import 'package:freezed_annotation/freezed_annotation.dart';

part 'till_device.freezed.dart';

/// This phone as one of the outlet's cashier devices, and where its count of
/// receipt numbers stands (`GET /pos/device`).
@freezed
abstract class TillDevice with _$TillDevice {
  const factory TillDevice({
    required String deviceId,

    /// K01: part of every receipt number the device makes.
    required String code,

    /// What its Manager called it, such as Kasir depan.
    required String name,

    /// The outlet's code and the device's, such as BDG01-K01.
    required String orderNoPrefix,

    /// The outlet's day the count is of, as YYYY-MM-DD.
    required String day,

    /// The count the device's next receipt number of [day] takes.
    required int nextNumber,
  }) = _TillDevice;
}
