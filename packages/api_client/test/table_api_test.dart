import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for TableApi
void main() {
  final instance = MakiApiClient().getTableApi();

  group(TableApi, () {
    // Cancel a schedule
    //
    // Needs `table.manage`, and a schedule that isn't over. Its tables are back in service; it stays as a record, with who cancelled it. 
    //
    //Future cancelTableSchedule(String oid, String sid) async
    test('test cancelTableSchedule', () async {
      // TODO
    });

    // Create an area
    //
    // Needs `table.manage`. It goes last in the order, with an empty canvas.
    //
    //Future<Area> createArea(String oid, AreaInput areaInput) async
    test('test createArea', () async {
      // TODO
    });

    // Create a table
    //
    // Needs `table.manage`. It isn't placed on its area's layout yet; the area's layout version moves on. 
    //
    //Future<Table> createTable(String oid, TableInput tableInput) async
    test('test createTable', () async {
      // TODO
    });

    // Take tables out of service for a time
    //
    // Needs `table.manage`. Its tables are `scheduled` from its start until its end. One that overlaps another schedule at a table is a warning (409 `schedule_overlaps`) until it is sent with `confirm_overlap`. 
    //
    //Future<Schedule> createTableSchedule(String oid, ScheduleInput scheduleInput) async
    test('test createTableSchedule', () async {
      // TODO
    });

    // Delete an area
    //
    // Needs `table.manage`. Only an area that holds no table, deleted ones aside; its canvas goes with it, and its name is free again. 
    //
    //Future deleteArea(String oid, String aid) async
    test('test deleteArea', () async {
      // TODO
    });

    // Delete a table
    //
    // Needs `table.manage`. Only a table nobody is seated at; a sale at it under way finishes first, and counts. Its name is free again. 
    //
    //Future deleteTable(String oid, String tid) async
    test('test deleteTable', () async {
      // TODO
    });

    // One area
    //
    // Needs `table.view`.
    //
    //Future<Area> getArea(String oid, String aid) async
    test('test getArea', () async {
      // TODO
    });

    // How the outlet seats its dine-in customers
    //
    // Needs `table.view`; the Owner reads any outlet's. The cashier reads it in the catalog (`dine_in_mode`). 
    //
    //Future<DineInModeSetting> getDineInMode(String oid) async
    test('test getDineInMode', () async {
      // TODO
    });

    // An area's layout
    //
    // Needs `table.view`. Its decorations, and its tables with their statuses now, placed or not. 
    //
    //Future<Layout> getLayout(String oid, String aid) async
    test('test getLayout', () async {
      // TODO
    });

    // The cashier's floor
    //
    // Needs `checkout.create`. The outlet's areas that hold tables, in order, with their decorations, and their tables with their statuses now; the cashier picks a table from it, and releases one. Where the outlet seats its customers by number stands (`dine_in_mode` `number`), `areas` is empty: there is no table to pick. 
    //
    //Future<Floor> getPosTables(String oid) async
    test('test getPosTables', () async {
      // TODO
    });

    // One table
    //
    // Needs `table.view`.
    //
    //Future<Table> getTable(String oid, String tid) async
    test('test getTable', () async {
      // TODO
    });

    // One schedule
    //
    // Needs `table.view`.
    //
    //Future<Schedule> getTableSchedule(String oid, String sid) async
    test('test getTableSchedule', () async {
      // TODO
    });

    // The outlet's dining areas
    //
    // Needs `table.view`. In their order (`sort_order`, then the name); deleted areas never show. 
    //
    //Future<AreaList> listAreas(String oid, { int page, int pageSize }) async
    test('test listAreas', () async {
      // TODO
    });

    // The outlet's table schedules
    //
    // Needs `table.view`. The latest first, past ones and cancelled ones included.
    //
    //Future<ScheduleList> listTableSchedules(String oid, { ScheduleStatus status, int page, int pageSize }) async
    test('test listTableSchedules', () async {
      // TODO
    });

    // The outlet's tables
    //
    // Needs `table.view`. By area, in the areas' order, then by name as people read numbers (\"Meja 2\" before \"Meja 10\"), with their statuses now. 
    //
    //Future<TableList> listTables(String oid, { String areaId, TableStatus status, String q, int page, int pageSize }) async
    test('test listTables', () async {
      // TODO
    });

    // Release a table its customers have left
    //
    // Needs `checkout.create`. The sales before it no longer seat anyone there; a sale at it under way finishes first, and is released too. A table nobody is seated at stays as it is, and records nothing. 
    //
    //Future<Table> releaseTable(String oid, String tid) async
    test('test releaseTable', () async {
      // TODO
    });

    // Put the areas in a new order
    //
    // Needs `table.manage`. `area_ids` lists every area of the outlet, each once, in the new order. 
    //
    //Future reorderAreas(String oid, AreaOrderRequest areaOrderRequest) async
    test('test reorderAreas', () async {
      // TODO
    });

    // Save an area's whole layout
    //
    // Needs `table.manage`. The editor saves the whole layout at once: the tables in `tables` placed in their boxes, the area's others off the layout, and its decorations. It saves on the version it opened; the layout as it is records nothing and keeps its version. 
    //
    //Future<Layout> saveLayout(String oid, String aid, LayoutInput layoutInput) async
    test('test saveLayout', () async {
      // TODO
    });

    // Choose how the outlet seats its dine-in customers
    //
    // Needs `table.manage`. It holds from the outlet's next sale on: a sale under way finishes first, under the mode it began with. The orders taken keep their tables or their stands, and the areas and tables stay, for the table mode again. Saving the mode the outlet has changes and records nothing; a change is `dine_in_mode.updated` in the Log Action, with what it was. `mode` is `required` and `oneof`. 
    //
    //Future<DineInModeSetting> setDineInMode(String oid, DineInModeSetting dineInModeSetting) async
    test('test setDineInMode', () async {
      // TODO
    });

    // Turn a table on or off at the cashier
    //
    // Needs `table.manage`. It stays on its layout either way; a table customers are seated at stays occupied until it is released. 
    //
    //Future<Table> setTableStatus(String oid, String tid, ActiveRequest activeRequest) async
    test('test setTableStatus', () async {
      // TODO
    });

    // Rename an area
    //
    // Needs `table.manage`. A name as it is records nothing.
    //
    //Future<Area> updateArea(String oid, String aid, AreaInput areaInput) async
    test('test updateArea', () async {
      // TODO
    });

    // Change a table
    //
    // Needs `table.manage`. A table moved to another area leaves its place on the old one's layout; both layouts' versions move on. A change of nothing records nothing. 
    //
    //Future<Table> updateTable(String oid, String tid, TableInput tableInput) async
    test('test updateTable', () async {
      // TODO
    });

    // Change a schedule
    //
    // Needs `table.manage`, and a schedule that isn't over. One under way keeps the start it has, past or not; overlaps are as for a new one. A change of nothing records nothing. 
    //
    //Future<Schedule> updateTableSchedule(String oid, String sid, ScheduleInput scheduleInput) async
    test('test updateTableSchedule', () async {
      // TODO
    });

  });
}
