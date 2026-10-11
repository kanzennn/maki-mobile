import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/features/pos/domain/totals.dart';

part 'voucher.freezed.dart';

/// The kinds of discount a voucher gives.
enum VoucherType { percent, amount }

/// A voucher as the cashier checked it (`POST …/vouchers/validate`): its
/// code, and the terms its discount is worked out from again as the cart
/// changes.
@freezed
abstract class Voucher with _$Voucher {
  const factory Voucher({
    required String voucherId,

    /// As the vouchers keep it: capitals, whatever was typed.
    required String code,
    required VoucherType type,

    /// Basis points for a percentage (1000 is 10%), whole rupiah for an
    /// amount.
    required int value,
    String? name,

    /// A percentage's most, in rupiah; null for none.
    int? maxDiscount,

    /// The subtotal the voucher needs; null for none.
    int? minSpend,
  }) = _Voucher;
}

/// What a voucher gives a subtotal: its discount, and whether it applies at
/// all. Short of the minimum spend it doesn't, and the sale can't take it
/// yet.
typedef VoucherOffer = ({int discount, bool applies});

/// The server's rule (`maki-be/internal/voucher/discount.go`), which the web
/// cashier follows too, and which
/// `maki-be/api/test-vectors/voucher-discounts.json` pins down: a
/// percentage of the subtotal, rounded to the nearest rupiah, half up, then
/// held to its maximum; an amount as it is; either never past the subtotal.
VoucherOffer voucherDiscount(Voucher voucher, int subtotal) {
  final minSpend = voucher.minSpend;
  if (minSpend != null && subtotal < minSpend) {
    return (discount: 0, applies: false);
  }
  var discount = voucher.value;
  if (voucher.type == VoucherType.percent) {
    discount = share(subtotal, voucher.value);
    final most = voucher.maxDiscount;
    if (most != null) discount = min(discount, most);
  }
  return (discount: min(discount, subtotal), applies: true);
}
