import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';

import '../../../helpers/pos.dart';

CartLine line({
  String menuId = 'kopi',
  String name = 'Kopi susu',
  int qty = 1,
  String note = '',
}) => CartLine(menuId: menuId, name: name, qty: qty, note: note);

void main() {
  group('mostOf', () {
    test('is the stock of a tracked menu, and 999 otherwise', () {
      expect(mostOf(testMenu()), 3);
      expect(mostOf(testMenu(stockQty: 0)), 0);
      expect(mostOf(testMenu(stockQty: -2)), 0);
      expect(mostOf(testMenu(stockQty: 5000)), maxQty);
      expect(mostOf(testMenu(trackStock: false, stockQty: null)), maxQty);
      // A count left from when it was tracked doesn't limit it.
      expect(mostOf(testMenu(trackStock: false, stockQty: 2)), maxQty);
    });
  });

  group('addOne', () {
    test('starts a line, then adds to it, up to the stock', () {
      var lines = addOne([], testMenu());
      expect(lines, [line()]);
      lines = addOne(addOne(lines, testMenu()), testMenu());
      expect(lines, [line(qty: 3)]);
      expect(addOne(lines, testMenu()), [line(qty: 3)]);
    });

    test("can't add a menu that has none left", () {
      expect(
        addOne([], testMenu(stockQty: 0, stock: StockLevel.out)),
        <CartLine>[],
      );
    });

    test('stops at the most lines an order has', () {
      final full = [for (var i = 0; i < maxLines; i++) line(menuId: 'm$i')];
      expect(addOne(full, testMenu()), same(full));
    });
  });

  group('setQty', () {
    test('keeps a line between 1 and the stock, and 0 takes it out', () {
      final lines = [line(qty: 2)];
      expect(setQty(lines, testMenu(), 3), [line(qty: 3)]);
      expect(setQty(lines, testMenu(), 10), [line(qty: 3)]);
      expect(setQty(lines, testMenu(), 0), <CartLine>[]);
      expect(setQty(lines, testMenu(stockQty: 0), 1), <CartLine>[]);
    });

    test('leaves the other lines as they are', () {
      final lines = [line(), line(menuId: 'teh', name: 'Es teh', qty: 4)];
      expect(setQty(lines, testMenu(), 2), [
        line(qty: 2),
        line(menuId: 'teh', name: 'Es teh', qty: 4),
      ]);
    });
  });

  group('setNote and removeLine', () {
    test('note a line, at most 100 characters, or take it out', () {
      final lines = [line(), line(menuId: 'teh', name: 'Es teh')];
      expect(setNote(lines, 'teh', 'less sugar')[1].note, 'less sugar');
      expect(setNote(lines, 'teh', 'x' * 150)[1].note, hasLength(100));
      expect(setNote(lines, 'teh', 'x')[0].note, '');
      expect(removeLine(lines, 'kopi'), [line(menuId: 'teh', name: 'Es teh')]);
    });

    test('count characters as the server does, never splitting one', () {
      // Each takes two UTF-16 code units, and one code point.
      final note = setNote([line()], 'kopi', '☕' * 50 + '🍞' * 60).single.note;
      expect(note.runes, hasLength(100));
      expect(note, '☕' * 50 + '🍞' * 50);
    });
  });

  group('reconcile', () {
    test('drops what is no longer on sale or has none left, and cuts what is '
        'short', () {
      final menus = {
        'kopi': testMenu(stockQty: 2),
        'teh': testMenu(menuId: 'teh', trackStock: false, stockQty: null),
        'roti': testMenu(menuId: 'roti', stockQty: 0, stock: StockLevel.out),
      };
      final result = reconcile([
        line(qty: 5),
        line(menuId: 'teh', name: 'Es teh', qty: 4),
        line(menuId: 'roti', name: 'Roti bakar'),
        line(menuId: 'gone', name: 'Jus'),
      ], menus);

      expect(result.lines, [
        line(qty: 2),
        line(menuId: 'teh', name: 'Es teh', qty: 4),
      ]);
      expect([for (final l in result.removed) l.name], ['Roti bakar', 'Jus']);
      expect(result.reduced, [line(qty: 2)]);
    });

    test('leaves an order that still fits as it is', () {
      final result = reconcile([line(qty: 2)], {'kopi': testMenu()});
      expect(result.lines, [line(qty: 2)]);
      expect(result.removed, isEmpty);
      expect(result.reduced, isEmpty);
    });
  });
}
