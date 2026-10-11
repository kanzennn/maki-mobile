import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';

part 'cart.freezed.dart';

/// A line of the cart: a menu, how many, and the customer's wish for it.
/// The name is the menu's when it was picked, to say which one went if the
/// catalog drops it; the price is always the catalog's.
@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    required String menuId,
    required String name,
    required int qty,
    @Default('') String note,
  }) = _CartLine;
}

/// The server's limits on an order.
const maxQty = 999;
const maxLines = 100;

/// Characters in a line's note, counted as the server counts them: Unicode
/// code points.
const maxNote = 100;

/// The most of [menu] one order can take: its stock when tracked.
int mostOf(CatalogMenu menu) =>
    menu.trackStock ? min(max(menu.stockQty ?? 0, 0), maxQty) : maxQty;

/// One more of [menu]: a new line, or one more on its line, up to what there
/// is.
List<CartLine> addOne(List<CartLine> lines, CatalogMenu menu) {
  final line = lines.where((l) => l.menuId == menu.menuId).firstOrNull;
  if (line != null) return setQty(lines, menu, line.qty + 1);
  if (mostOf(menu) < 1 || lines.length >= maxLines) return lines;
  return [...lines, CartLine(menuId: menu.menuId, name: menu.name, qty: 1)];
}

/// [menu]'s line at [qty], kept between 1 and what there is; 0 takes it out.
List<CartLine> setQty(List<CartLine> lines, CatalogMenu menu, int qty) {
  final capped = min(qty, mostOf(menu));
  if (capped < 1) return removeLine(lines, menu.menuId);
  return [
    for (final line in lines)
      if (line.menuId == menu.menuId) line.copyWith(qty: capped) else line,
  ];
}

/// The line's note, cut to [maxNote] characters.
List<CartLine> setNote(List<CartLine> lines, String menuId, String note) {
  final kept = String.fromCharCodes(note.runes.take(maxNote));
  return [
    for (final line in lines)
      if (line.menuId == menuId) line.copyWith(note: kept) else line,
  ];
}

List<CartLine> removeLine(List<CartLine> lines, String menuId) => [
  for (final line in lines)
    if (line.menuId != menuId) line,
];

/// What the cart became when it met the catalog as it is now: its `lines`,
/// the lines whose menu is no longer on sale or has none left (`removed`),
/// and those cut to the stock there is (`reduced`).
typedef Reconciled = ({
  List<CartLine> lines,
  List<CartLine> removed,
  List<CartLine> reduced,
});

/// The cart against the catalog: a line whose menu is gone from it, or has
/// none left, comes out, and one for more than there is is cut to what there
/// is. Prices aren't in the cart; they are always the catalog's.
Reconciled reconcile(List<CartLine> lines, Map<String, CatalogMenu> menus) {
  final kept = <CartLine>[];
  final removed = <CartLine>[];
  final reduced = <CartLine>[];
  for (final line in lines) {
    final menu = menus[line.menuId];
    final most = menu == null ? 0 : mostOf(menu);
    if (most < 1) {
      removed.add(line);
    } else if (line.qty > most) {
      final cut = line.copyWith(qty: most);
      reduced.add(cut);
      kept.add(cut);
    } else {
      kept.add(line);
    }
  }
  return (lines: kept, removed: removed, reduced: reduced);
}
