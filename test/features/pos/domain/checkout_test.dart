import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/browse.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';

import '../../../helpers/pos.dart';

void main() {
  setUpAll(initializeTimeZones);

  const lines = [NewOrderLine(menuId: 'kopi', qty: 2, price: 18000)];

  NewOrder order({DateTime? at, int nextNumber = 5}) => makeOrder(
    type: OrderType.takeaway,
    lines: lines,
    total: 41580,
    received: 50000,
    device: testTill(nextNumber: nextNumber),
    at: at ?? DateTime.utc(2026, 10, 1, 3),
    timeZone: 'Asia/Jakarta',
    newId: () => 'ord1',
  );

  group('priced', () {
    test("prices the cart at the catalog's prices and the outlet's rates", () {
      final result = priced([
        const CartLine(menuId: 'kopi', name: 'Kopi', qty: 2, note: '  hot '),
        const CartLine(menuId: 'teh', name: 'Es teh', qty: 1, note: '   '),
      ], testCatalog());

      expect(result.lines, const [
        NewOrderLine(menuId: 'kopi', qty: 2, price: 18000, note: 'hot'),
        NewOrderLine(menuId: 'teh', qty: 1, price: 8000),
      ]);
      // 44.000, service 5% 2.200, tax 10% of 46.200: 4.620.
      expect(result.totals, (
        subtotal: 44000,
        discount: 0,
        service: 2200,
        tax: 4620,
        total: 50820,
      ));
      expect(result.count, 3);
    });

    test('skips a line whose menu has left the catalog', () {
      final result = priced([
        const CartLine(menuId: 'gone', name: 'Jus', qty: 1),
      ], testCatalog());
      expect(result.lines, isEmpty);
      expect(result.totals.total, 0);
    });

    test("takes the voucher's discount off before the charges", () {
      const three = [CartLine(menuId: 'kopi', name: 'Kopi', qty: 3)];
      final result = priced(three, testCatalog(), voucher: testVoucher());
      // 54.000 - 12,5% (6.750) = 47.250; service 2.363; tax 4.961.
      expect(result.totals, (
        subtotal: 54000,
        discount: 6750,
        service: 2363,
        tax: 4961,
        total: 54574,
      ));
      expect(result.voucherApplies, isTrue);
      expect(priced(three, testCatalog()).voucherApplies, isTrue);
    });

    test("gives nothing short of the voucher's minimum spend", () {
      final result = priced(
        const [CartLine(menuId: 'kopi', name: 'Kopi', qty: 2)],
        testCatalog(),
        voucher: testVoucher(),
      );
      expect(result.totals.discount, 0);
      expect(result.totals.total, 41580);
      expect(result.voucherApplies, isFalse);
    });
  });

  group('makeOrder', () {
    test("numbers the order from the device's count, for the outlet's day it "
        'was made on', () {
      expect(
        order(),
        NewOrder(
          orderId: 'ord1',
          orderNo: 'BDG01-K01-20261001-0005',
          type: OrderType.takeaway,
          clientCreatedAt: DateTime.utc(2026, 10, 1, 3),
          lines: lines,
          total: 41580,
          method: PaymentMethod.cash,
          received: 50000,
        ),
      );
      // The next morning in Bandung: a new day, a new count.
      expect(
        order(at: DateTime.utc(2026, 10, 1, 17, 30)).orderNo,
        'BDG01-K01-20261002-0001',
      );
    });

    test('takes the time in UTC, to the millisecond', () {
      final at = DateTime.utc(2026, 10, 1, 3, 4, 5, 678, 901).toLocal();
      final made = order(at: at).clientCreatedAt;
      expect(made.isUtc, isTrue);
      expect(made, DateTime.utc(2026, 10, 1, 3, 4, 5, 678));
    });

    test('gives each order an ID of its own', () {
      final ids = {
        for (var i = 0; i < 50; i++)
          makeOrder(
            type: OrderType.dineIn,
            lines: lines,
            total: 41580,
            received: 50000,
            device: testTill(),
            at: DateTime.utc(2026, 10, 1, 3),
            timeZone: 'Asia/Jakarta',
          ).orderId,
      };
      expect(ids, hasLength(50));
    });
  });

  group('makeOrder with a voucher', () {
    test('sends its code, and none without one', () {
      final withCode = makeOrder(
        type: OrderType.takeaway,
        lines: lines,
        total: 36854,
        received: 50000,
        device: testTill(),
        at: DateTime.utc(2026, 10, 1, 3),
        timeZone: 'Asia/Jakarta',
        voucherCode: 'MERDEKA17',
        newId: () => 'ord1',
      );
      expect(withCode.voucherCode, 'MERDEKA17');
      expect(order().voucherCode, isNull);
    });
  });

  group('renumber', () {
    test(
      'gives the order the next number of its own day, and keeps its ID',
      () {
        final first = order();
        final again = renumber(first, testTill(nextNumber: 9), 'Asia/Jakarta');
        expect(again, first.copyWith(orderNo: 'BDG01-K01-20261001-0009'));
      },
    );
  });

  group('afterSale', () {
    test('moves the count past the number just used, on its day only', () {
      final device = testTill();
      expect(afterSale(device, 'BDG01-K01-20261001-0005').nextNumber, 6);
      expect(afterSale(device, 'BDG01-K01-20261001-0012').nextNumber, 13);
      expect(afterSale(device, 'BDG01-K01-20261001-0002').nextNumber, 5);
      expect(afterSale(device, 'BDG01-K01-20261002-0001'), device);
      expect(afterSale(device, 'not a number'), device);
    });
  });

  group('shown', () {
    final menus = testCatalog().menus;
    List<String> names(List<CatalogMenu> menus) => [
      for (final m in menus) m.name,
    ];

    test("keeps the catalog's order, in a category or all", () {
      expect(names(shown(menus)), ['Kopi susu', 'Es teh', 'Roti bakar']);
      expect(names(shown(menus, category: 'minum')), ['Kopi susu', 'Es teh']);
      expect(names(shown(menus, category: 'makan')), ['Roti bakar']);
    });

    test('finds a name or an SKU, in any case', () {
      expect(names(shown(menus, search: '  KOPI ')), ['Kopi susu']);
      expect(names(shown(menus, search: 'teh-0')), ['Es teh']);
      expect(names(shown(menus, search: 'roti', category: 'minum')), isEmpty);
    });
  });
}
