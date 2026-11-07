import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/receipt_ticket.dart';
import 'package:maki_mobile/l10n/app_localizations_id.dart';

import '../../../helpers/pos.dart';
import '../../../helpers/printer.dart';

Order _order({
  OrderStatus status = OrderStatus.paid,
  String? voidReason,
  String? standNumber,
  String? tableName,
  String? voucherCode,
  int discount = 0,
  String? note,
  String name = 'Kopi susu',
}) => Order(
  orderId: 'ord1',
  orderNo: 'BDG01-K01-20261001-0005',
  type: OrderType.dineIn,
  status: status,
  cashierName: 'Budi',
  lines: [
    OrderLine(
      orderLineId: 'l1',
      menuId: 'kopi',
      name: name,
      price: 18000,
      qty: 2,
      lineTotal: 36000,
      note: note,
    ),
  ],
  subtotal: 36000,
  discount: discount,
  serviceBps: 500,
  service: 1800,
  taxBps: 1000,
  tax: 3780,
  total: 41580,
  payment: const OrderPayment(
    method: PaymentMethod.cash,
    amount: 41580,
    received: 50000,
    change: 8420,
  ),
  clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4),
  voidReason: voidReason,
  voucherCode: voucherCode,
  tableName: tableName,
  standNumber: standNumber,
);

List<String> _printed(
  Order order, {
  PaperWidth paper = PaperWidth.mm58,
  CatalogOutlet? outlet,
}) => ticketLines(
  receiptTicket(
    order: order,
    outlet: outlet ?? testCatalogOutlet(),
    paper: paper,
  ),
);

void main() {
  setUpAll(() async {
    initializeTimeZones();
    await initializeDateFormatting();
  });

  test('says what the receipt on screen says, in plain text', () {
    final lines = _printed(_order(tableName: 'A1', note: 'less sugar'));

    expect(lines.first.trim(), 'Maki Bandung');
    expect(lines, contains('BDG01-K01-20261001-0005'));
    expect(lines, contains('Kopi susu'));
    expect(lines, contains('less sugar'));
    bool row(String start, String end) =>
        lines.any((l) => l.startsWith(start) && l.endsWith(end));
    expect(row('2 x Rp 18.000', 'Rp 36.000'), isTrue, reason: '$lines');
    expect(row('Kasir', 'Budi'), isTrue);
    expect(row('Meja', 'A1'), isTrue);
    expect(row('Total', 'Rp 41.580'), isTrue);
    expect(row('Kembalian', 'Rp 8.420'), isTrue);
    expect(lines.map((l) => l.trim()), contains('Terima kasih'));
  });

  test('uses the width of the roll', () {
    for (final paper in PaperWidth.values) {
      final lines = _printed(
        _order(name: 'Nasi goreng spesial dengan telur dan ayam suwir pedas'),
        paper: paper,
      );
      final total = lines.firstWhere((l) => l.startsWith('Total'));
      expect(total.length, paper.columns);
      for (final line in lines) {
        expect(line.length, lessThanOrEqualTo(paper.columns), reason: line);
      }
    }
  });

  test("speaks the outlet's language", () {
    final lines = _printed(_order(), outlet: testCatalogOutlet(locale: 'en'));

    expect(lines.map((l) => l.trim()), contains('Thank you'));
    expect(lines.any((l) => l.startsWith('Change')), isTrue);
  });

  test('shows a stand number by itself, for the waiter', () {
    final lines = _printed(_order(standNumber: 'B-3'));

    expect(lines.map((l) => l.trim()), contains('B-3'));
    expect(lines.map((l) => l.trim()), contains('Nomor papan'));
  });

  test('says VOID and why', () {
    final lines = _printed(
      _order(status: OrderStatus.voided, voidReason: 'Salah input'),
    );

    expect(lines.map((l) => l.trim()), contains('VOID'));
    expect(lines.map((l) => l.trim()), contains('Alasan: Salah input'));
  });

  test('shows the voucher, and its discount', () {
    final lines = _printed(_order(voucherCode: 'MERDEKA17', discount: 5000));

    expect(
      lines.any((l) => l.contains('MERDEKA17') && l.endsWith('-Rp 5.000')),
      isTrue,
      reason: '$lines',
    );
  });

  test("doesn't let a note or a name send the printer a command", () {
    // ticketLines fails on a command it doesn't know.
    final lines = _printed(
      _order(name: 'Kopi\x1DV\x00 ☕', note: 'jangan\x1B@ pedas'),
    );

    expect(lines, contains('KopiV ?'));
    expect(lines, contains('jangan@ pedas'));
  });

  test('prints a test ticket for the roll it was told of', () {
    final lines = ticketLines(
      printerTestTicket(AppLocalizationsId(), PaperWidth.mm80),
    );

    expect(lines.first.trim(), 'Tes printer Maki');
    expect(lines.any((l) => l.endsWith('80 mm') && l.length == 48), isTrue);
  });
}
