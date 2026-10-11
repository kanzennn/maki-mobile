import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for OrderApi
void main() {
  final instance = MakiApiClient().getOrderApi();

  group(OrderApi, () {
    // Take an order the cashier charged for
    //
    // Needs `checkout.create`, from one of the outlet's devices in use. The device makes the order's ID (a CUID2) and its receipt number, so the ID is the order's idempotency key: sending the same order again, as after a lost answer, answers 200 with the order as it was taken, never a second one, even from a device revoked since. The same ID with anything else in it, or from another outlet, is 409 `order_id_conflict`.  Everything is checked in one transaction, against the outlet as it is when the order arrives:  - the receipt number is the device's (`order_no_prefix` of   `GET …/pos/device`), carries the outlet's day of   `client_created_at`, and isn't taken (409 `order_no_taken`: the   cashier asks for the next number and sends the order again); - the payment method is on (409 `payment_method_unavailable`); - each menu is on sale (409 `menu_unavailable`, `details.menus` its   IDs), at the price the cashier showed (409 `prices_changed`,   `details.menus` each `menu_id` with its `price`), with stock enough   for its lines together (409 `order_stock_insufficient`,   `details.menus` each `menu_id` with what is `available`); - the voucher, when `voucher_code` names one, is for the sale, as   `POST …/vouchers/validate` checks it (404 `voucher_not_found`, 409   `voucher_not_for_outlet`, `voucher_inactive`, `voucher_expired`,   `voucher_used_up`, `voucher_not_started`), and the subtotal   reaches its minimum spend (409 `voucher_min_spend`,   `details.min_spend`): the cashier takes it off and says why; - the order fits how the outlet seats its dine-in customers now   (`dine_in_mode`): where they sit at tables, no `stand_number`;   where they take number stands, no `table_id`, and a dine-in order   carries its stand's `stand_number` (409 `dine_in_mode_changed`,   `details.mode` the outlet's). The Manager changed it since the   catalog was loaded: the cashier loads it again, takes the table or   the number off, and says why; - the table, when `table_id` names one (dine-in only), can be sat at:   the outlet's, not deleted, and available or occupied (409   `table_unavailable`, `details.status` the table's, `inactive` or   `scheduled`, or `missing`): the cashier takes it off and says why; - `total` is the server's, from those prices, the voucher's terms   and the outlet's rates (409 `total_changed`, `details.total` the   server's): subtotal, less the voucher's discount, then the service   charge on that, then the tax on both, each rounded to the nearest   rupiah, half up. `api/test-vectors/order-totals.json` and   `voucher-discounts.json` hold worked cases.  The menus are locked in the order of their IDs, so two cashiers selling the last one at once sell it once; then the voucher, so two outlets taking its last use at once take it once; then the outlet's dine-in mode, shared, so a change of it waits for the sale; then the table, shared with other sales at it, so a change, a release or a delete of it waits for the sale. Then the order, with its voucher's code and its table's name as they are and its stand's number, its lines with the menus' names and prices as they are, and its payment are saved; tracked stock goes down, a sale movement per menu; the voucher's use is taken; and the Log Action records `order.created`. Cash gives change from `received`. 
    //
    //Future<Order> createOrder(String oid, CreateOrderRequest createOrderRequest) async
    test('test createOrder', () async {
      // TODO
    });

    // An order, with its lines and payment
    //
    // Needs `checkout.create` or `order.void`. For the receipt, printed again, and the void. 
    //
    //Future<Order> getOrder(String oid, String orid) async
    test('test getOrder', () async {
      // TODO
    });

    // Everything the cashier sells from
    //
    // Needs `checkout.create`. In one answer, so a device can later keep it offline whole: the outlet for the receipt, with its rates; the payment methods it takes; and its menus in the cashier's order, with the categories that hold them.  The menus are the active menus of active categories. Those that can be sold come first, out of stock last; within each, by the categories' order, then name. Inactive and deleted menus aren't there at all. The stock is as it is now: the cashier loads the catalog again after each sale, and now and then. 
    //
    //Future<PosCatalog> getPosCatalog(String oid) async
    test('test getPosCatalog', () async {
      // TODO
    });

    // The device the cashier runs on, and its receipt numbers today
    //
    // Needs `checkout.create`, from one of the outlet's devices in use: sent as the cashier starts. Marks the device seen, and sends a browser's `maki_device` cookie again, so a device in use keeps it.  The device makes each receipt number itself: `order_no_prefix-YYYYMMDD-NNNN`, with the outlet's day and the device's count that day, at least four digits. `next_number` is the count its next one today takes; a new day starts it at 1. The cashier asks again after `order_no_taken`. 
    //
    //Future<PosDevice> getPosDevice(String oid) async
    test('test getPosDevice', () async {
      // TODO
    });

    // Today's orders
    //
    // Needs `checkout.create` or `order.void`. The outlet's orders made today, in its time zone, newest first, voided ones included. `q` narrows them to the receipt numbers holding it, in any case. 
    //
    //Future<OrderList> listOrders(String oid, { String q, int page, int pageSize }) async
    test('test listOrders', () async {
      // TODO
    });

    // Void an order
    //
    // Needs `order.void`, and a reason. The order and its payment become `void`; nothing else of them changes. What it sold goes back to the stock of its menus still tracked, a void movement per menu; a deleted menu's stock stays as it is. Its voucher's use is given back, the voucher turned off since or not. Recorded as `order.voided`. An order is voided once (409 `order_already_void`). 
    //
    //Future<Order> voidOrder(String oid, String orid, VoidOrderRequest voidOrderRequest) async
    test('test voidOrder', () async {
      // TODO
    });

  });
}
