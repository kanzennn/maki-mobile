# Hardware

- [The receipt printer](#the-receipt-printer)
- [The EDC machine](#the-edc-machine)

## The receipt printer

The Android cashier prints to a thermal printer over Bluetooth Classic, in
ESC/POS. There is no printer library: the app's own channel
(`android/.../BluetoothPrinterChannel.kt`) opens a Serial Port Profile socket
and writes the bytes, so the only new code that touches Bluetooth is ours.

**No physical printer has been tested yet.** The bytes are tested exactly, and
the Kotlin side compiles, but nothing has been printed on paper. See
[What to check on a first printer](#what-to-check-on-a-first-printer).

### Using it

1. Pair the printer in Android's Bluetooth settings. Many take the PIN `0000`
   or `1234`.
2. In the app: **Akun → Printer struk**. Android asks for the *Nearby devices*
   permission the first time, on Android 12 and newer.
3. Choose the printer, the paper width, and whether receipts print by themselves
   once a sale is saved.
4. Press **Cetak tes**.

The settings are the phone's, so signing out keeps them.

### What it supports

| | |
| --- | --- |
| Connection | Bluetooth Classic SPP, to a paired device. Printers that only speak Bluetooth Low Energy can't be reached |
| Paper | 58 mm (32 columns) and 80 mm (48 columns), in the printer's standard font |
| Text | Plain ASCII: accents come off, and anything else, an emoji for one, prints as `?` |
| Paper cut | Sends a cut after feeding. A printer without a cutter should ignore it |
| A logo, QR code, cash drawer | Not built |

### How it is put together

| Part | Where | What it does |
| --- | --- | --- |
| ESC/POS builder | `lib/core/printing/esc_pos.dart` | Text to bytes: wrapping, rows, safe characters |
| The receipt | `lib/features/pos/presentation/receipt_ticket.dart` | What `ReceiptView` shows, as a ticket, in the outlet's language |
| The bridge and settings | `lib/features/pos/data/receipt_printer.dart` | The method channel, and the settings in secure storage |
| State | `lib/features/pos/presentation/cubit/printer_cubit.dart` | One ticket at a time; a failure is an answer, not an exception |
| Android | `android/.../BluetoothPrinterChannel.kt` | The permission, the paired devices, the socket |

**A failed print never touches the sale.** The sale is saved before its receipt
shows, and printing only ever reads the saved order. The problem shows under the
print button, because a snack bar would sit behind the checkout dialog's barrier.

**A connection lasts one ticket.** Many of these printers serve one phone at a
time, so holding a connection would lock another till out.

### What to check on a first printer

These can't be known without one, so try them before relying on it:

- The test ticket comes out, and the columns line up on both paper widths. Some
  80 mm printers fit 42 columns rather than 48, and would then wrap each line.
- A receipt with a long menu name, a note, and a voided receipt.
- The last line isn't cut off. The channel waits half a second before closing
  the socket, and a slow printer may need longer (`DRAIN_MILLIS`).
- The cut command prints nothing odd on a printer without a cutter.
- A printer turned off, or out of range, says so within a reasonable time.

## The EDC machine

**A frame, not a connection.** Debit stays off in Payment Control, no screen uses
this yet, and no machine has been connected: which bank's or vendor's machine
decides how a driver talks to it, so none is written. The web cashier has the
same frame, in `maki-fe/src/modules/edc`.

| Part | Where | What it does |
| --- | --- | --- |
| The driver's interface | `lib/features/pos/domain/edc.dart` | `EdcTerminal.charge`, its answers, and a slip number's rules |
| The manual driver | `lib/features/pos/data/manual_edc_terminal.dart` | The spec's first step: the cashier keys the amount into the machine and types in its slip's number |
| One sale's charge | `lib/features/pos/presentation/cubit/edc_charge_cubit.dart` | Asks the machine once, and decides what may happen next |
| The order | `makeOrder(reference: …)`, then `payment.reference` in the API | The server keeps the number, in capitals |

### The rules a driver relies on

- **A customer pays once.** The machine is asked again only after it answered
  that the money didn't move (`EdcNotChargedResult`: declined, cancelled, or
  never reached). A driver answers that only when it is sure.
- **No answer isn't a no.** A timeout, a dropped link or an exception may come
  after the card went through, so the cashier reads the slip and types its
  number in. The charge is never retried by itself.
- **A resend isn't a charge.** The reference goes in the order, whose ID is its
  idempotency key, so a lost answer from the server sends the order again and
  never reaches the machine.
- **No card data.** A driver hands over the amount and takes back the slip's
  number. A card's number, its track data and its PIN stay in the machine. The
  till and the server refuse a number that looks like a card's.

### Adding a driver

1. Implement `EdcTerminal` in `lib/features/pos/data/`, in terms of the vendor's
   protocol or SDK, behind a method channel as the printer's is.
2. Map its answers to `EdcResult`, sending anything uncertain to
   `EdcByHandResult(EdcByHand.noAnswer)`.
3. Re-audit (standard §9): the permissions it adds, what it logs, and the
   vendor's SDK.

### What releasing debit still needs

- The checkout's debit screen, on `EdcChargeCubit`, with its words in both
  languages. Only the cash flow calls `makeOrder` today.
- Releasing the method: `PaymentMethodReleased` in the backend, and the locked
  toggle in Payment Control.
- The receipt and the printed ticket: the slip's number, and a debit's lines,
  which now assume cash.
- **A sale the server refuses after the card went through.** The menu sold out,
  or a price changed, while the card was in the machine. The money has moved and
  the sale wasn't taken, so the screen must say so and send the cashier to void
  it on the machine. Checking the sale before charging narrows this, and can't
  close it.
- A void in Maki doesn't refund the card: the cashier voids it on the machine as
  well, and the screen must say so.
