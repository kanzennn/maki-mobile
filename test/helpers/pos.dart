import 'package:dio/dio.dart';
import 'package:maki_api_client/maki_api_client.dart' as api;
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';

// The cashier's test data, in the app's own models and as the API sends it.
// The outlet is Maki Bandung (BDG01) in Asia/Jakarta, with a 5% service
// charge and 10% tax; this phone is its device K01.

CatalogMenu testMenu({
  String menuId = 'kopi',
  String categoryId = 'minum',
  String name = 'Kopi susu',
  int price = 18000,
  bool trackStock = true,
  int? stockQty = 3,
  StockLevel stock = StockLevel.ok,
  String? sku,
}) => CatalogMenu(
  menuId: menuId,
  categoryId: categoryId,
  name: name,
  price: price,
  trackStock: trackStock,
  stockQty: stockQty,
  stock: stock,
  sku: sku,
);

CatalogOutlet testCatalogOutlet({
  int serviceBps = 500,
  int taxBps = 1000,
  String timeZone = 'Asia/Jakarta',
  String locale = 'id',
}) => CatalogOutlet(
  outletId: 'o1',
  code: 'BDG01',
  name: 'Maki Bandung',
  address: 'Jl. Braga 1',
  phone: '022 123',
  timeZone: timeZone,
  locale: locale,
  taxBps: taxBps,
  serviceBps: serviceBps,
);

Catalog testCatalog({
  List<CatalogMenu>? menus,
  CatalogOutlet? outlet,
  List<PaymentMethod> paymentMethods = const [PaymentMethod.cash],
  DineInMode dineInMode = DineInMode.table,
}) => Catalog(
  outlet: outlet ?? testCatalogOutlet(),
  paymentMethods: paymentMethods,
  dineInMode: dineInMode,
  categories: const [
    CatalogCategory(
      categoryId: 'minum',
      name: 'Minuman',
      icon: '🥤',
      itemCount: 2,
    ),
    CatalogCategory(categoryId: 'makan', name: 'Makanan', itemCount: 1),
  ],
  menus:
      menus ??
      [
        testMenu(),
        testMenu(
          menuId: 'teh',
          name: 'Es teh',
          price: 8000,
          trackStock: false,
          stockQty: null,
          stock: StockLevel.untracked,
          sku: 'TEH-01',
        ),
        testMenu(
          menuId: 'roti',
          categoryId: 'makan',
          name: 'Roti bakar',
          price: 15000,
          stockQty: 0,
          stock: StockLevel.out,
        ),
      ],
);

TillDevice testTill({String day = '2026-10-01', int nextNumber = 5}) =>
    TillDevice(
      deviceId: 'd1',
      code: 'K01',
      name: 'Kasir depan',
      orderNoPrefix: 'BDG01-K01',
      day: day,
      nextNumber: nextNumber,
    );

// As the API sends them.

Map<String, Object?> posMenuJson({
  String menuId = 'kopi',
  String categoryId = 'minum',
  String name = 'Kopi susu',
  int price = 18000,
  bool trackStock = true,
  int? stockQty = 3,
  int? stockAlert = 1,
  api.StockStatus stockStatus = api.StockStatus.ok,
  String? sku,
}) => api.PosMenu(
  menuId: menuId,
  categoryId: categoryId,
  name: name,
  description: null,
  sku: sku,
  price: price,
  imageUrl: null,
  trackStock: trackStock,
  stockQty: stockQty,
  stockAlert: stockAlert,
  stockStatus: stockStatus,
).toJson();

/// The catalog as `GET /pos/catalog` answers: Kopi susu (3 left), Es teh
/// (untracked) and Roti bakar (sold out), unless [menus] says otherwise; an
/// outlet seating its customers at tables, unless [dineInMode] says
/// `number`.
Map<String, Object?> posCatalogJson({
  List<Map<String, Object?>>? menus,
  int serviceBps = 500,
  int taxBps = 1000,
  String locale = 'id',
  List<api.PaymentMethod> paymentMethods = const [api.PaymentMethod.cash],
  String dineInMode = 'table',
}) => {
  'outlet': api.PosOutlet(
    outletId: 'o1',
    code: 'BDG01',
    name: 'Maki Bandung',
    address: 'Jl. Braga 1',
    phone: '022 123',
    timezone: 'Asia/Jakarta',
    locale: locale == 'en'
        ? api.PosOutletLocaleEnum.en
        : api.PosOutletLocaleEnum.id,
    taxBps: taxBps,
    serviceBps: serviceBps,
  ).toJson(),
  'payment_methods': [for (final m in paymentMethods) m.value],
  'dine_in_mode': dineInMode,
  'categories': [
    api.PosCategory(
      categoryId: 'minum',
      name: 'Minuman',
      icon: '🥤',
      itemCount: 2,
    ).toJson(),
    api.PosCategory(
      categoryId: 'makan',
      name: 'Makanan',
      icon: null,
      itemCount: 1,
    ).toJson(),
  ],
  'menus':
      menus ??
      [
        posMenuJson(),
        posMenuJson(
          menuId: 'teh',
          name: 'Es teh',
          price: 8000,
          trackStock: false,
          stockQty: null,
          stockAlert: null,
          stockStatus: api.StockStatus.untracked,
          sku: 'TEH-01',
        ),
        posMenuJson(
          menuId: 'roti',
          categoryId: 'makan',
          name: 'Roti bakar',
          price: 15000,
          stockQty: 0,
          stockStatus: api.StockStatus.out_,
        ),
      ],
};

/// This phone as `GET /pos/device` answers.
Map<String, Object?> posDeviceJson({
  String day = '2026-10-01',
  int nextNumber = 5,
}) => {
  'device': {
    'device_id': 'd1',
    'code': 'K01',
    'name': 'Kasir depan',
    'platform': 'android',
  },
  'order_no_prefix': 'BDG01-K01',
  'day': day,
  'next_number': nextNumber,
};

/// An order as the server answers it: two Kopi susu, in cash, with the
/// outlet's rates, unless the arguments say otherwise; [voucherCode] with
/// its [discount] for a sale that used a voucher, [tableId] and [tableName]
/// for one at a table, [standNumber] for one by a number stand.
Map<String, Object?> orderJson({
  String orderId = 'ord1',
  String orderNo = 'BDG01-K01-20261001-0005',
  String type = 'dine_in',
  String status = 'paid',
  List<({String menuId, String name, int price, int qty, String? note})>? lines,
  int serviceBps = 500,
  int taxBps = 1000,
  int? received = 50000,
  String clientCreatedAt = '2026-10-01T03:04:05.000Z',
  String? voidReason,
  String? voucherCode,
  int discount = 0,
  String? tableId,
  String? tableName,
  String? standNumber,
}) {
  final items =
      lines ??
      [(menuId: 'kopi', name: 'Kopi susu', price: 18000, qty: 2, note: null)];
  final subtotal = items.fold(0, (sum, l) => sum + l.price * l.qty);
  final base = subtotal - discount;
  final service = (base * serviceBps + 5000) ~/ 10000;
  final tax = ((base + service) * taxBps + 5000) ~/ 10000;
  final total = base + service + tax;
  return {
    'order_id': orderId,
    'order_no': orderNo,
    'device_id': 'd1',
    'type': type,
    'table_id': tableId,
    'table_name': tableName,
    'stand_number': standNumber,
    'status': status,
    'cashier': {'user_id': 'u1', 'name': 'Budi'},
    'items': [
      for (final (i, l) in items.indexed)
        {
          'order_item_id': '$orderId-$i',
          'menu_id': l.menuId,
          'menu_name': l.name,
          'price': l.price,
          'qty': l.qty,
          'note': l.note,
          'line_total': l.price * l.qty,
        },
    ],
    'subtotal': subtotal,
    'voucher_code': voucherCode,
    'voucher_discount': discount,
    'service_bps': serviceBps,
    'service': service,
    'tax_bps': taxBps,
    'tax': tax,
    'total': total,
    'payment': {
      'method': 'cash',
      'amount': total,
      'received': received,
      'change': received == null ? null : received - total,
      'status': status,
    },
    'client_created_at': clientCreatedAt,
    'created_at': clientCreatedAt,
    'voided_at': status == 'void' ? '2026-10-01T04:00:00.000Z' : null,
    'voided_by': status == 'void' ? {'user_id': 'u2', 'name': 'Sari'} : null,
    'void_reason': voidReason,
  };
}

/// An order in today's list.
Map<String, Object?> orderSummaryJson({
  String orderId = 'ord1',
  String orderNo = 'BDG01-K01-20261001-0005',
  String status = 'paid',
  int total = 41580,
  int itemCount = 2,
  String clientCreatedAt = '2026-10-01T03:04:05.000Z',
  String? tableName,
  String? standNumber,
}) => {
  'order_id': orderId,
  'order_no': orderNo,
  'device_id': 'd1',
  'type': 'dine_in',
  'table_name': tableName,
  'stand_number': standNumber,
  'status': status,
  'total': total,
  'item_count': itemCount,
  'payment_method': 'cash',
  'cashier': {'user_id': 'u1', 'name': 'Budi'},
  'client_created_at': clientCreatedAt,
  'created_at': clientCreatedAt,
};

/// A page of today's orders.
Map<String, Object?> orderListJson(
  List<Map<String, Object?>> orders, {
  int page = 1,
  int pageSize = 20,
  int? total,
}) => {
  'data': orders,
  'meta': {
    'page': page,
    'page_size': pageSize,
    'total': total ?? orders.length,
  },
};

/// The cashier's two loads on an activated phone, as `FakeHttpAdapter`
/// routes: this device, and the catalog.
Map<String, (int, Object?) Function(RequestOptions)> tillRoutes({
  Map<String, Object?>? catalog,
  Map<String, Object?>? device,
}) => {
  'GET /api/v1/outlets/o1/pos/device': (_) => (200, device ?? posDeviceJson()),
  'GET /api/v1/outlets/o1/pos/catalog': (_) =>
      (200, catalog ?? posCatalogJson()),
};

/// A voucher of the Owner's: 12,5% off, at most Rp 20.000, from Rp 50.000
/// spent, unless the arguments say otherwise.
Voucher testVoucher({int value = 1250, int? minSpend = 50000}) => Voucher(
  voucherId: 'v1',
  code: 'MERDEKA17',
  name: 'Diskon Merdeka',
  type: VoucherType.percent,
  value: value,
  maxDiscount: 20000,
  minSpend: minSpend,
);

/// `POST …/vouchers/validate`'s answer for [testVoucher] on [subtotal].
Map<String, Object?> voucherQuoteJson({
  int subtotal = 54000,
  int value = 1250,
}) {
  final offer = voucherDiscount(testVoucher(value: value), subtotal);
  return {
    'voucher': {
      'voucher_id': 'v1',
      'code': 'MERDEKA17',
      'name': 'Diskon Merdeka',
      'type': 'percent',
      'value': value,
      'max_discount': 20000,
      'min_spend': 50000,
    },
    'discount': offer.discount,
    'applies': offer.applies,
  };
}

/// A table on the floor, as `GET /pos/tables` sends it: available, without
/// seats given, and not placed, unless the arguments say otherwise.
Map<String, Object?> floorTableJson(
  String id,
  String name, {
  int? capacity,
  String shape = 'square',
  (int, int, int, int)? box,
  String status = 'available',
  Map<String, Object?>? seated,
}) => {
  'table_id': id,
  'name': name,
  'capacity': capacity,
  'shape': shape,
  'box': box == null
      ? null
      : {'x': box.$1, 'y': box.$2, 'w': box.$3, 'h': box.$4},
  'rotation': 0,
  'status': status,
  'seated': seated,
};

/// The floor as `GET /pos/tables` answers: Indoor with A1 free, A2 with
/// customers seated since 12.30 WIB after two sales, and A3 off and not
/// placed; Teras with T1 scheduled off and T2 free. [areas] for another.
Map<String, Object?> floorJson({List<Map<String, Object?>>? areas}) => {
  'areas':
      areas ??
      [
        {
          'area_id': 'a-in',
          'name': 'Indoor',
          'decorations': [
            {'kind': 'wall', 'x': 0, 'y': 31, 'w': 48, 'h': 1, 'rotation': 0},
            {'kind': 'cashier', 'x': 40, 'y': 0, 'w': 6, 'h': 3, 'rotation': 0},
          ],
          'tables': [
            floorTableJson('t-a1', 'A1', capacity: 4, box: (2, 2, 3, 3)),
            floorTableJson(
              't-a2',
              'A2',
              capacity: 2,
              shape: 'round',
              box: (10, 2, 3, 3),
              status: 'occupied',
              seated: {'since': '2026-10-01T05:30:00.000Z', 'orders': 2},
            ),
            floorTableJson('t-a3', 'A3', status: 'inactive'),
          ],
        },
        {
          'area_id': 'a-out',
          'name': 'Teras',
          'decorations': <Object?>[],
          'tables': [
            floorTableJson(
              't-t1',
              'T1',
              capacity: 6,
              shape: 'rectangle',
              box: (0, 0, 5, 3),
              status: 'scheduled',
            ),
            floorTableJson('t-t2', 'T2', capacity: 4, box: (10, 0, 3, 3)),
          ],
        },
      ],
};

/// A table as `POST …/tables/{tid}/release` answers: free again.
Map<String, Object?> releasedTableJson(String id, String name) => {
  'table_id': id,
  'area': {'area_id': 'a-in', 'name': 'Indoor'},
  'name': name,
  'capacity': 2,
  'shape': 'round',
  'box': {'x': 10, 'y': 2, 'w': 3, 'h': 3},
  'rotation': 0,
  'is_active': true,
  'status': 'available',
  'seated': null,
  'created_at': '2026-10-01T01:00:00.000Z',
  'updated_at': '2026-10-01T01:00:00.000Z',
};

/// [floorJson] in the app's models.
Floor testFloor() => Floor(
  areas: [
    FloorArea(
      areaId: 'a-in',
      name: 'Indoor',
      decorations: const [
        FloorDecoration(
          kind: DecorationKind.wall,
          box: GridBox(x: 0, y: 31, w: 48, h: 1),
        ),
        FloorDecoration(
          kind: DecorationKind.cashier,
          box: GridBox(x: 40, y: 0, w: 6, h: 3),
        ),
      ],
      tables: [
        const FloorTable(
          tableId: 't-a1',
          name: 'A1',
          capacity: 4,
          shape: TableShape.square,
          box: GridBox(x: 2, y: 2, w: 3, h: 3),
          status: TableStatus.available,
        ),
        FloorTable(
          tableId: 't-a2',
          name: 'A2',
          capacity: 2,
          shape: TableShape.round,
          box: const GridBox(x: 10, y: 2, w: 3, h: 3),
          status: TableStatus.occupied,
          seated: Seated(since: DateTime.utc(2026, 10, 1, 5, 30), orders: 2),
        ),
        const FloorTable(
          tableId: 't-a3',
          name: 'A3',
          shape: TableShape.square,
          status: TableStatus.inactive,
        ),
      ],
    ),
    const FloorArea(
      areaId: 'a-out',
      name: 'Teras',
      decorations: [],
      tables: [
        FloorTable(
          tableId: 't-t1',
          name: 'T1',
          capacity: 6,
          shape: TableShape.rectangle,
          box: GridBox(x: 0, y: 0, w: 5, h: 3),
          status: TableStatus.scheduled,
        ),
        FloorTable(
          tableId: 't-t2',
          name: 'T2',
          capacity: 4,
          shape: TableShape.square,
          box: GridBox(x: 10, y: 0, w: 3, h: 3),
          status: TableStatus.available,
        ),
      ],
    ),
  ],
);
