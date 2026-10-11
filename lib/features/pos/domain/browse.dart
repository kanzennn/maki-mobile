import 'package:maki_mobile/features/pos/domain/catalog.dart';

/// The catalog's menus in [category], or in all when it is null, whose name
/// or SKU holds [search], in any case. They keep the catalog's order:
/// filtering never moves a menu out of stock up.
List<CatalogMenu> shown(
  List<CatalogMenu> menus, {
  String? category,
  String search = '',
}) {
  final query = search.trim().toLowerCase();
  return [
    for (final menu in menus)
      if ((category == null || menu.categoryId == category) &&
          (query.isEmpty ||
              menu.name.toLowerCase().contains(query) ||
              (menu.sku?.toLowerCase().contains(query) ?? false)))
        menu,
  ];
}
