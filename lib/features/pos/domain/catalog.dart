import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';

/// What the cashier sells from (`GET /pos/catalog`): the outlet with its
/// rates, the payment methods it takes, how it seats its dine-in customers,
/// its categories, and its menus in the cashier's order. The stock is as it
/// was when loaded; the server decides each sale against the stock as it is.
@freezed
abstract class Catalog with _$Catalog {
  const factory Catalog({
    required CatalogOutlet outlet,
    required List<PaymentMethod> paymentMethods,
    required List<CatalogCategory> categories,

    /// In the cashier's order: in stock first, sold out last, then by
    /// category and name.
    required List<CatalogMenu> menus,

    /// At a table the cashier may pick, or by the number on the stand the
    /// customer took, which a dine-in sale then needs.
    @Default(DineInMode.table) DineInMode dineInMode,
  }) = _Catalog;

  const Catalog._();

  Map<String, CatalogMenu> get menusById => {
    for (final menu in menus) menu.menuId: menu,
  };

  CatalogCategory? category(String categoryId) =>
      categories.where((c) => c.categoryId == categoryId).firstOrNull;
}

/// The outlet as the cashier's totals and receipts need it.
@freezed
abstract class CatalogOutlet with _$CatalogOutlet {
  const factory CatalogOutlet({
    required String outletId,
    required String code,
    required String name,

    /// IANA name, such as Asia/Jakarta: the outlet's day, and the times on
    /// its receipts.
    required String timeZone,

    /// The receipts' language, `id` or `en`, whatever the screen's is.
    required String locale,

    /// Basis points: 1000 is 10%.
    required int taxBps,
    required int serviceBps,
    String? address,
    String? phone,
  }) = _CatalogOutlet;
}

@freezed
abstract class CatalogCategory with _$CatalogCategory {
  const factory CatalogCategory({
    required String categoryId,
    required String name,

    /// How many of its menus are on sale.
    required int itemCount,

    /// An emoji, or null for the default one.
    String? icon,
  }) = _CatalogCategory;
}

/// How a menu's stock stands, as the server reads it: low is at or under
/// the menu's alert, out is none left.
enum StockLevel { untracked, ok, low, out }

@freezed
abstract class CatalogMenu with _$CatalogMenu {
  const factory CatalogMenu({
    required String menuId,
    required String categoryId,
    required String name,

    /// Whole rupiah.
    required int price,
    required bool trackStock,
    required StockLevel stock,
    String? sku,

    /// What is left, when the stock is tracked.
    int? stockQty,
  }) = _CatalogMenu;
}

enum PaymentMethod { cash, qris, debit }

/// How the outlet seats its dine-in customers, one way at a time: at the
/// tables of its layout, or wherever they set down the number stand the
/// cashier gave them, where a waiter brings the order.
enum DineInMode { table, number }
