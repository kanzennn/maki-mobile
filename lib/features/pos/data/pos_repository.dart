import 'package:maki_api_client/maki_api_client.dart' as api;
import 'package:maki_mobile/core/api/api_call.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';

/// The cashier's endpoints, for the outlet the user works in: what it sells
/// from, this phone as one of its devices, its tables, and its orders.
/// Generated types stop here: everything above gets the domain's models.
class PosRepository {
  PosRepository(this._api, this._deviceTokens, {required this.outletId});

  final api.MakiApiClient _api;
  final DeviceTokenStore _deviceTokens;
  final String outletId;

  /// Today's orders come a page at a time.
  static const pageSize = 20;

  api.OrderApi get _orders => _api.getOrderApi();

  Future<Catalog> catalog() async =>
      catalogFromDto(await apiCall(_orders.getPosCatalog(oid: outletId)));

  /// This phone as one of the outlet's devices, with its count of receipt
  /// numbers today. Throws `device_not_registered` for a phone the outlet
  /// hasn't activated, and `device_revoked` for one it revoked.
  Future<TillDevice> device() async =>
      tillDeviceFromDto(await apiCall(_orders.getPosDevice(oid: outletId)));

  /// Makes this phone one of the outlet's cashier devices, as its Manager,
  /// under [name], and keeps the token that proves it.
  Future<void> activate(String name) async {
    final activated = await apiCall(
      _api.getDeviceApi().activateDevice(
        oid: outletId,
        activateDeviceRequest: api.ActivateDeviceRequest(
          name: name.trim(),
          platform: api.ActivateDeviceRequestPlatformEnum.android,
        ),
      ),
    );
    final token = activated.token;
    if (token == null) {
      throw StateError('an Android activation answers with its token');
    }
    await _deviceTokens.save(token);
  }

  /// Checks the code a customer gave, from this phone as one of the outlet's
  /// tills, on the cart's [subtotal]: the voucher's terms, or the refusal
  /// saying why the sale can't take it. Takes nothing; the sale does.
  Future<Voucher> validateVoucher(String code, int subtotal) async {
    final quote = await apiCall(
      _api.getVoucherApi().validateVoucher(
        oid: outletId,
        validateVoucherRequest: api.ValidateVoucherRequest(
          code: code,
          subtotal: subtotal,
        ),
      ),
    );
    return voucherFromDto(quote.voucher);
  }

  /// The outlet's tables as the cashier picks from them, with each one's
  /// status now.
  Future<Floor> floor() async => floorFromDto(
    await apiCall(_api.getTableApi().getPosTables(oid: outletId)),
  );

  /// Customers have left [tableId]: it is free again for the next ones. A
  /// table nobody is seated at stays as it is.
  Future<void> releaseTable(String tableId) async {
    await apiCall(_api.getTableApi().releaseTable(oid: outletId, tid: tableId));
  }

  /// Sends an order; the same order sent again is answered with it as it
  /// was taken, never a second one.
  Future<Order> createOrder(NewOrder order) async => orderFromDto(
    await apiCall(
      _orders.createOrder(
        oid: outletId,
        createOrderRequest: newOrderToDto(order),
      ),
    ),
  );

  /// A page of the outlet's orders today, newest first; [search] narrows
  /// them to the receipt numbers holding it.
  Future<OrderPage> todayOrders({String search = '', int page = 1}) async {
    final list = await apiCall(
      _orders.listOrders(
        oid: outletId,
        q: search.trim().isEmpty ? null : search.trim(),
        page: page,
        // The size loadMore counts pages by, whatever the client's default.
        // ignore: avoid_redundant_argument_values
        pageSize: pageSize,
      ),
    );
    return (
      orders: [for (final o in list.data) orderSummaryFromDto(o)],
      total: list.meta.total,
    );
  }

  Future<Order> order(String orderId) async => orderFromDto(
    await apiCall(_orders.getOrder(oid: outletId, orid: orderId)),
  );

  /// Voids an order, for [reason]: its payment is cancelled and its stock
  /// comes back.
  Future<Order> voidOrder(String orderId, String reason) async => orderFromDto(
    await apiCall(
      _orders.voidOrder(
        oid: outletId,
        orid: orderId,
        voidOrderRequest: api.VoidOrderRequest(reason: reason.trim()),
      ),
    ),
  );
}

Catalog catalogFromDto(api.PosCatalog dto) => Catalog(
  outlet: CatalogOutlet(
    outletId: dto.outlet.outletId,
    code: dto.outlet.code,
    name: dto.outlet.name,
    address: dto.outlet.address,
    phone: dto.outlet.phone,
    timeZone: dto.outlet.timezone,
    locale: dto.outlet.locale.value,
    taxBps: dto.outlet.taxBps,
    serviceBps: dto.outlet.serviceBps,
  ),
  paymentMethods: [for (final m in dto.paymentMethods) _method(m)],
  dineInMode: switch (dto.dineInMode) {
    api.DineInMode.table => DineInMode.table,
    api.DineInMode.number => DineInMode.number,
  },
  categories: [
    for (final c in dto.categories)
      CatalogCategory(
        categoryId: c.categoryId,
        name: c.name,
        icon: c.icon,
        itemCount: c.itemCount,
      ),
  ],
  menus: [
    for (final m in dto.menus)
      CatalogMenu(
        menuId: m.menuId,
        categoryId: m.categoryId,
        name: m.name,
        sku: m.sku,
        price: m.price,
        trackStock: m.trackStock,
        stockQty: m.stockQty,
        stock: switch (m.stockStatus) {
          api.StockStatus.untracked => StockLevel.untracked,
          api.StockStatus.ok => StockLevel.ok,
          api.StockStatus.low => StockLevel.low,
          api.StockStatus.out_ => StockLevel.out,
        },
      ),
  ],
);

TillDevice tillDeviceFromDto(api.PosDevice dto) => TillDevice(
  deviceId: dto.device.deviceId,
  code: dto.device.code,
  name: dto.device.name,
  orderNoPrefix: dto.orderNoPrefix,
  // A date without a time, read as midnight wherever the phone is: its
  // fields are the day's.
  day:
      '${dto.day.year.toString().padLeft(4, '0')}-'
      '${dto.day.month.toString().padLeft(2, '0')}-'
      '${dto.day.day.toString().padLeft(2, '0')}',
  nextNumber: dto.nextNumber,
);

api.CreateOrderRequest newOrderToDto(NewOrder order) => api.CreateOrderRequest(
  orderId: order.orderId,
  orderNo: order.orderNo,
  type: _typeToDto(order.type),
  clientCreatedAt: order.clientCreatedAt.toUtc(),
  items: [
    for (final line in order.lines)
      api.CreateOrderItem(
        menuId: line.menuId,
        qty: line.qty,
        price: line.price,
        note: line.note,
      ),
  ],
  voucherCode: order.voucherCode,
  tableId: order.tableId,
  standNumber: order.standNumber,
  total: order.total,
  payment: api.CreateOrderPayment(
    method: switch (order.method) {
      PaymentMethod.cash => api.PaymentMethod.cash,
      PaymentMethod.qris => api.PaymentMethod.qris,
      PaymentMethod.debit => api.PaymentMethod.debit,
    },
    received: order.received,
  ),
);

Order orderFromDto(api.Order dto) => Order(
  orderId: dto.orderId,
  orderNo: dto.orderNo,
  type: _type(dto.type),
  status: _status(dto.status),
  cashierName: dto.cashier.name,
  lines: [
    for (final item in dto.items)
      OrderLine(
        orderLineId: item.orderItemId,
        menuId: item.menuId,
        name: item.menuName,
        price: item.price,
        qty: item.qty,
        note: item.note,
        lineTotal: item.lineTotal,
      ),
  ],
  subtotal: dto.subtotal,
  discount: dto.voucherDiscount,
  voucherCode: dto.voucherCode,
  serviceBps: dto.serviceBps,
  service: dto.service,
  taxBps: dto.taxBps,
  tax: dto.tax,
  total: dto.total,
  payment: OrderPayment(
    method: _method(dto.payment.method),
    amount: dto.payment.amount,
    received: dto.payment.received,
    change: dto.payment.change,
  ),
  clientCreatedAt: dto.clientCreatedAt.toUtc(),
  voidReason: dto.voidReason,
  tableId: dto.tableId,
  tableName: dto.tableName,
  standNumber: dto.standNumber,
);

Voucher voucherFromDto(api.VoucherTerms dto) => Voucher(
  voucherId: dto.voucherId,
  code: dto.code,
  name: dto.name,
  type: switch (dto.type) {
    api.VoucherType.percent => VoucherType.percent,
    api.VoucherType.amount => VoucherType.amount,
  },
  value: dto.value,
  maxDiscount: dto.maxDiscount,
  minSpend: dto.minSpend,
);

OrderSummary orderSummaryFromDto(api.OrderSummary dto) => OrderSummary(
  orderId: dto.orderId,
  orderNo: dto.orderNo,
  type: _type(dto.type),
  status: _status(dto.status),
  total: dto.total,
  itemCount: dto.itemCount,
  method: _method(dto.paymentMethod),
  cashierName: dto.cashier.name,
  clientCreatedAt: dto.clientCreatedAt.toUtc(),
  tableName: dto.tableName,
  standNumber: dto.standNumber,
);

Floor floorFromDto(api.Floor dto) => Floor(
  areas: [
    for (final area in dto.areas)
      FloorArea(
        areaId: area.areaId,
        name: area.name,
        decorations: [
          for (final d in area.decorations)
            FloorDecoration(
              kind: switch (d.kind) {
                api.DecorationKind.wall => DecorationKind.wall,
                api.DecorationKind.cashier => DecorationKind.cashier,
                api.DecorationKind.door => DecorationKind.door,
              },
              box: GridBox(x: d.x, y: d.y, w: d.w, h: d.h),
            ),
        ],
        tables: [
          for (final t in area.tables)
            FloorTable(
              tableId: t.tableId,
              name: t.name,
              capacity: t.capacity,
              shape: switch (t.shape) {
                api.TableShape.square => TableShape.square,
                api.TableShape.round => TableShape.round,
                api.TableShape.rectangle => TableShape.rectangle,
              },
              box: switch (t.box) {
                final api.Box box => GridBox(
                  x: box.x,
                  y: box.y,
                  w: box.w,
                  h: box.h,
                ),
                null => null,
              },
              status: switch (t.status) {
                api.TableStatus.available => TableStatus.available,
                api.TableStatus.occupied => TableStatus.occupied,
                api.TableStatus.inactive => TableStatus.inactive,
                api.TableStatus.scheduled => TableStatus.scheduled,
              },
              seated: switch (t.seated) {
                final api.Seated seated => Seated(
                  since: seated.since.toUtc(),
                  orders: seated.orders,
                ),
                null => null,
              },
            ),
        ],
      ),
  ],
);

PaymentMethod _method(api.PaymentMethod method) => switch (method) {
  api.PaymentMethod.cash => PaymentMethod.cash,
  api.PaymentMethod.qris => PaymentMethod.qris,
  api.PaymentMethod.debit => PaymentMethod.debit,
};

OrderType _type(api.OrderType type) => switch (type) {
  api.OrderType.dineIn => OrderType.dineIn,
  api.OrderType.takeaway => OrderType.takeaway,
};

api.OrderType _typeToDto(OrderType type) => switch (type) {
  OrderType.dineIn => api.OrderType.dineIn,
  OrderType.takeaway => api.OrderType.takeaway,
};

OrderStatus _status(api.OrderStatus status) => switch (status) {
  api.OrderStatus.paid => OrderStatus.paid,
  api.OrderStatus.void_ => OrderStatus.voided,
};
