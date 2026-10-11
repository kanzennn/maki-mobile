import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for MenuApi
void main() {
  final instance = MakiApiClient().getMenuApi();

  group(MenuApi, () {
    // Add, take away or count a menu's stock
    //
    // Needs `stock.adjust`, on a tracked menu. `in` adds `qty` and `out` takes it away (1 to 1,000,000 at once); `set` is a stock take, the count found (0 to 1,000,000), recorded even when it matches. The count never goes below zero this way, nor above 1,000,000.  The menu is locked while its count changes, so adjustments made together each start from the count the one before left: none is lost. Each is a stock movement and a Log Action entry (`stock.adjusted`, with the count before and after, the type, the reason and the note). Answers with the menu as the adjustment left it. 
    //
    //Future<Menu> adjustStock(String oid, String mid, StockAdjustmentInput stockAdjustmentInput) async
    test('test adjustStock', () async {
      // TODO
    });

    // Create a category
    //
    // Needs `menu.manage`. It goes last in the order.
    //
    //Future<Category> createCategory(String oid, CategoryInput categoryInput) async
    test('test createCategory', () async {
      // TODO
    });

    // Create a menu
    //
    // Needs `menu.manage`. A tracked menu (`track_stock`) starts from `initial_stock`, its first stock movement. 
    //
    //Future<Menu> createMenu(String oid, MenuInput menuInput) async
    test('test createMenu', () async {
      // TODO
    });

    // Delete a category
    //
    // Needs `menu.manage`. Only a category that holds no menu, deleted menus aside; its name is free again afterwards. 
    //
    //Future deleteCategory(String oid, String cid) async
    test('test deleteCategory', () async {
      // TODO
    });

    // Delete a menu
    //
    // Needs `menu.manage`. Past sales keep its name and price; its SKU is free again. 
    //
    //Future deleteMenu(String oid, String mid) async
    test('test deleteMenu', () async {
      // TODO
    });

    // One category
    //
    // Needs `menu.view`.
    //
    //Future<Category> getCategory(String oid, String cid) async
    test('test getCategory', () async {
      // TODO
    });

    // One menu
    //
    // Needs `menu.view`.
    //
    //Future<Menu> getMenu(String oid, String mid) async
    test('test getMenu', () async {
      // TODO
    });

    // The outlet's menu categories
    //
    // Needs `menu.view`. In the order the cashier shows them (`sort_order`, then the name); deleted categories never show. 
    //
    //Future<CategoryList> listCategories(String oid, { int page, int pageSize }) async
    test('test listCategories', () async {
      // TODO
    });

    // The outlet's menus
    //
    // Needs `menu.view`. In the cashier's order: by the categories' order, then by name. Deleted menus never show. 
    //
    //Future<MenuList> listMenus(String oid, { String q, String categoryId, String status, StockStatus stock, int page, int pageSize }) async
    test('test listMenus', () async {
      // TODO
    });

    // A menu's stock history
    //
    // Needs `menu.view`. Newest first, in the order the count changed in, each naming who made it (a deleted account keeps its name here). A menu whose tracking was turned off keeps its history; its count adds up to the history's `qty_change`. 
    //
    //Future<StockMovementList> listStockMovements(String oid, String mid, { int page, int pageSize }) async
    test('test listStockMovements', () async {
      // TODO
    });

    // Put the categories in a new order
    //
    // Needs `menu.manage`. `category_ids` lists every category of the outlet, each once, in the new order. 
    //
    //Future reorderCategories(String oid, CategoryOrderRequest categoryOrderRequest) async
    test('test reorderCategories', () async {
      // TODO
    });

    // Show or hide a category at the cashier
    //
    // Needs `menu.manage`. An inactive category, and every menu in it, is hidden at the cashier; they stay in the admin area. 
    //
    //Future<Category> setCategoryStatus(String oid, String cid, ActiveRequest activeRequest) async
    test('test setCategoryStatus', () async {
      // TODO
    });

    // Show or hide a menu at the cashier
    //
    // Needs `menu.manage`. An inactive menu is hidden at the cashier; it stays in the admin area and the reports. 
    //
    //Future<Menu> setMenuStatus(String oid, String mid, ActiveRequest activeRequest) async
    test('test setMenuStatus', () async {
      // TODO
    });

    // Set a menu's stock alert
    //
    // Needs `stock.adjust` or `menu.manage` (the alert is a field of the menu form too), on a tracked menu. At or below the alert, stock is `low`; null or 0 turns the alert off. The count stays as it is. A change is a `menu.updated` Log Action entry; the alert the menu already has records nothing. 
    //
    //Future<Menu> setStockAlert(String oid, String mid, StockAlertRequest stockAlertRequest) async
    test('test setStockAlert', () async {
      // TODO
    });

    // Change a category's name and icon
    //
    // Needs `menu.manage`. A field left out is cleared (the icon).
    //
    //Future<Category> updateCategory(String oid, String cid, CategoryInput categoryInput) async
    test('test updateCategory', () async {
      // TODO
    });

    // Change a menu
    //
    // Needs `menu.manage`. Every field but the stock count and the status (`is_active` is ignored here). A price change leaves past sales as they were. Turning `track_stock` on needs `initial_stock`, the count it starts from; once tracked, the count only changes through stock adjustments. Turning it off keeps the count and its history, unused. 
    //
    //Future<Menu> updateMenu(String oid, String mid, MenuInput menuInput) async
    test('test updateMenu', () async {
      // TODO
    });

  });
}
