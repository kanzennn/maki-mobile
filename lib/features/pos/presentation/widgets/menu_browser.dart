import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// DESIGN.md's search-input: an `outline` border, `rounded-field`, the
/// magnifier on the right, or the button that clears it once it holds text.
class MenuSearchField extends StatelessWidget {
  const MenuSearchField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    OutlineInputBorder border(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(MakiRadii.field),
          borderSide: BorderSide(color: color, width: width),
        );
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) => TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: l10n.posSearchLabel,
          enabledBorder: border(colors.outline),
          focusedBorder: border(context.tokens.brand, 2),
          suffixIcon: value.text.isEmpty
              ? Icon(Icons.search, color: context.tokens.iconMuted)
              : IconButton(
                  tooltip: l10n.posClearSearch,
                  icon: const Icon(Icons.close),
                  onPressed: controller.clear,
                ),
        ),
      ),
    );
  }
}

/// The category tiles in one row that scrolls on its own: All first, then
/// the catalog's. [compact] drops the count, as DESIGN.md's phone layout
/// does.
class CategoryTiles extends StatelessWidget {
  const CategoryTiles({
    required this.catalog,
    required this.selected,
    required this.onSelected,
    required this.compact,
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final Catalog catalog;

  /// The chosen category's ID; null is all of them.
  final String? selected;
  final ValueChanged<String?> onSelected;
  final bool compact;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: l10n.posCategories,
      container: true,
      explicitChildNodes: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CategoryTile(
              icon: null,
              name: l10n.posAllMenus,
              count: catalog.menus.length,
              selected: selected == null,
              compact: compact,
              onTap: () => onSelected(null),
            ),
            for (final category in catalog.categories)
              _CategoryTile(
                icon: category.icon,
                name: category.name,
                count: category.itemCount,
                selected: selected == category.categoryId,
                compact: compact,
                onTap: () => onSelected(category.categoryId),
              ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.icon,
    required this.name,
    required this.count,
    required this.selected,
    required this.compact,
    required this.onTap,
  });

  final String? icon;
  final String name;
  final int count;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tokens = context.tokens;
    final label = theme.textTheme.titleSmall?.copyWith(
      color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
    );
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: MakiSpacing.sm),
      child: Semantics(
        selected: selected,
        button: true,
        child: Material(
          color: selected
              ? tokens.primaryContainerMuted
              : theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MakiRadii.tile),
            side: BorderSide(
              color: selected ? tokens.brand : theme.colorScheme.outline,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48, minWidth: 88),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MakiSpacing.md,
                  vertical: MakiSpacing.sm,
                ),
                child: compact
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CategoryEmoji(icon, size: 20),
                          const SizedBox(width: MakiSpacing.sm),
                          Text(name, style: label),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CategoryEmoji(icon),
                          const SizedBox(height: MakiSpacing.sm),
                          Text(name, style: label),
                          Text(
                            l10n.posCategoryItems(count),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The menus as equal cards, in the catalog's order: [columns] across.
class MenuGrid extends StatelessWidget {
  const MenuGrid({
    required this.catalog,
    required this.menus,
    required this.inCart,
    required this.onAdd,
    required this.columns,
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final Catalog catalog;

  /// The menus shown: the catalog's, narrowed by a category and the search.
  final List<CatalogMenu> menus;

  /// How many of each menu the order holds.
  final Map<String, int> inCart;
  final ValueChanged<CatalogMenu> onAdd;
  final int columns;
  final EdgeInsets padding;

  /// The picture's height on a card.
  static const pictureHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (menus.isEmpty) {
      return Padding(
        padding: padding,
        child: Text(
          catalog.menus.isEmpty ? l10n.posMenusNone : l10n.posMenusNoMatch,
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      );
    }
    // Every card the same height, its text room growing with the system's
    // text size: two lines of name, the stock, the price.
    final text = MediaQuery.textScalerOf(context).scale(80);
    return GridView.builder(
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: MakiSpacing.md,
        crossAxisSpacing: MakiSpacing.md,
        mainAxisExtent: pictureHeight + 2 * MakiSpacing.md + 14 + text,
      ),
      itemCount: menus.length,
      itemBuilder: (context, i) {
        final menu = menus[i];
        return MenuCard(
          menu: menu,
          icon: catalog.category(menu.categoryId)?.icon,
          inCart: inCart[menu.menuId] ?? 0,
          onAdd: () => onAdd(menu),
        );
      },
    );
  }
}

/// DESIGN.md's product card: the picture (the category's emoji until menus
/// have photos), the name, the stock in words, the price. Low stock gets the
/// warning badge and its count in `on-warning-container`; sold out is the
/// card on `surface-variant`, the picture in grayscale, and can't be
/// picked. A menu in the order says how many.
class MenuCard extends StatelessWidget {
  const MenuCard({
    required this.menu,
    required this.icon,
    required this.inCart,
    required this.onAdd,
    super.key,
  });

  final CatalogMenu menu;
  final String? icon;
  final int inCart;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tokens = context.tokens;
    final out = menu.stock == StockLevel.out || mostOf(menu) < 1;
    final low = !out && menu.stock == StockLevel.low;
    final stock = !menu.trackStock
        ? l10n.posStockAlways
        : out
        ? l10n.posStockOut
        : l10n.posStockAvailable(menu.stockQty ?? 0);
    final price = formatRupiah(menu.price, l10n.localeName);

    return Semantics(
      button: true,
      enabled: !out,
      // Read as the card is meant: its name first, then the rest.
      label: [
        menu.name,
        price,
        stock,
        if (low) l10n.posStockLow,
        if (inCart > 0) l10n.posInCart(inCart),
      ].join(', '),
      excludeSemantics: true,
      child: Material(
        color: out ? tokens.surfaceVariant : theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MakiRadii.card),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: out ? null : onAdd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MenuGrid.pictureHeight,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ColoredBox(
                        color: theme.colorScheme.surfaceContainer,
                        child: Center(
                          child: out
                              ? ColorFiltered(
                                  colorFilter: _grayscale,
                                  child: CategoryEmoji(icon, size: 40),
                                )
                              : CategoryEmoji(icon, size: 40),
                        ),
                      ),
                    ),
                    if (low)
                      PositionedDirectional(
                        top: MakiSpacing.sm,
                        start: MakiSpacing.sm,
                        child: _Badge(
                          label: l10n.posStockLow,
                          fill: tokens.warningContainer,
                          ink: tokens.onWarningContainer,
                        ),
                      ),
                    if (inCart > 0)
                      PositionedDirectional(
                        bottom: MakiSpacing.sm,
                        end: MakiSpacing.sm,
                        child: _Badge(
                          label: l10n.posInCart(inCart),
                          fill: theme.colorScheme.primaryContainer,
                          ink: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(MakiSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.name,
                      style: theme.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: MakiSpacing.xs),
                    Text(
                      stock,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: low
                            ? tokens.onWarningContainer
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      price,
                      style: tokens.priceLarge.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.fill, required this.ink});

  final String label;
  final Color fill;
  final Color ink;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: fill,
      borderRadius: BorderRadius.circular(MakiRadii.field),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MakiSpacing.sm,
        vertical: 2,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ink),
      ),
    ),
  );
}

/// Luminance only: a sold-out menu's picture, pushed back.
const _grayscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0, 0, 0, 1, 0, //
]);
