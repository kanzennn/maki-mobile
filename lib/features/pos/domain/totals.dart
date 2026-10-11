/// A line as the totals read it: a price in whole rupiah, and how many.
typedef TotalsLine = ({int price, int qty});

/// An order's figures, in whole rupiah.
typedef Totals = ({
  int subtotal,
  int discount,
  int service,
  int tax,
  int total,
});

/// The most an order's lines may come to: the server's limit too.
const maxSubtotal = 1000000000;

/// The server's rule, which the web cashier follows too, and which
/// `maki-be/api/test-vectors/order-totals.json` pins down: the subtotal is
/// the lines' price × qty; the discount comes off it; the service charge is
/// on what is left, and the tax on that plus the service, each rounded to the
/// nearest rupiah, half up. Rates are basis points: 1000 is 10%.
Totals computeTotals(
  Iterable<TotalsLine> lines, {
  required int serviceBps,
  required int taxBps,
  int discount = 0,
}) {
  final subtotal = lines.fold(0, (sum, line) => sum + line.price * line.qty);
  final base = subtotal - discount;
  final service = share(base, serviceBps);
  final tax = share(base + service, taxBps);
  return (
    subtotal: subtotal,
    discount: discount,
    service: service,
    tax: tax,
    total: base + service + tax,
  );
}

/// [bps] / 10000 of [amount], rounded half up, in integers alone: no
/// division whose result a double could round the wrong way. A voucher's
/// percentage is rounded the same way.
int share(int amount, int bps) => (amount * bps + 5000) ~/ 10000;
