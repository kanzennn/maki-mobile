# Design system

How [`Maki/DESIGN.md`](../../DESIGN.md) becomes the Android app's theme, and
the cashier's screens drawn from it. The web app's counterpart is
[maki-fe's design-system.md](../../maki-fe/docs/design-system.md).

## Tokens and theme

- `app/theme/tokens.dart` holds DESIGN.md's values: `MakiColors`, the
  bundled font (Plus Jakarta Sans), `MakiRadii`, `MakiSpacing` on a 4dp
  rhythm, and `MakiBreakpoints` (600 and 840dp).
- `app/theme/app_theme.dart` builds `ThemeData` from them, plus
  `MakiTokens` (`context.tokens`) for what Material has no slot for: the
  brand orange, the warning pair, `surface-variant`, `icon-muted`,
  `price-lg`. Widgets read the theme, never a raw colour.
- **Orange, two ways** (DESIGN.md's WCAG adaptation): Material's
  `colorScheme.primary` is `primary-strong` #BC3F0B, so text, icons on a
  tint and every button with a label pass AA. The brand #FF5C33 is
  `context.tokens.brand`, for borders, the plus of the stepper and other
  icon-only fills.
- **Type roles:** `titleLarge` is headline-lg, `titleMedium` headline-md,
  `titleSmall` title-md, `bodyMedium` body-md, `labelMedium` label-md,
  `labelSmall` label-sm, and `MakiTokens.priceLarge` price-lg.
- **Touch targets** are 48dp everywhere (`materialTapTargetSize.padded`);
  the stepper looks 28dp and taps 48.

## Layouts

Layouts follow the window width (`context.windowSize`), never the device:

| Width | Layout |
| --- | --- |
| < 600dp (phones) | DESIGN.md's phone layout, menus in 2 columns |
| 600–839dp (tablets in portrait) | the phone layout, menus in 3 columns |
| ≥ 840dp (tablets in landscape) | the three columns: rail, menus (2–4 columns by width), Detail Items 360dp |

## Cashier screens

- **Navigation:** below 840dp a `NavigationBar` with Kasir, Meja when the
  outlet has tables, Riwayat and Akun; from 840dp a `NavigationRail` with
  the same. Both are white,
  the bar under a 1px `outline` border, not Material's tinted container. The
  active item is Material's indicator, which the theme makes DESIGN.md's
  `primary-container-strong` pill with a `primary-strong` icon.
- **The phone's sell screen** is DESIGN.md's: the search field across the
  top (an `outline` border, `rounded-field`, the magnifier on the right, a
  clear button once it holds text), the category tiles in one row that
  scrolls on its own (emoji and name, *Semua menu* first), then the menu
  grid. The user, the device and the date are on the Akun screen, as
  DESIGN.md moves them to settings.
- **The wide sell screen** adds a header row — *Pilih menu*, the device
  (*K01 · Kasir depan*) and the outlet's date — and the tiles with their
  *N item* count.
- **Menu cards:** the picture (the category's emoji on `surface-container`
  until menus have photos), the name in two lines at most, the stock in
  words (*Tersedia 12*, *Selalu tersedia*, *Habis*), the price in
  `price-lg`. Low stock is the `warning-container` badge at the picture's
  top left and its count in `on-warning-container`; sold out is the card on
  `surface-variant` with the picture in grayscale, and it can't be picked; a
  menu in the order says *N di pesanan* at the picture's bottom right. Every
  card has the same height, grown with the system's text size, and a screen
  reader reads it as its name, price, stock and badges.
- **The cart bar,** below 840dp once the order has a line: the item count
  and the total on the left, *Lihat pesanan* on the right, just above the
  navigation. It opens Detail Items full screen, with the pay button at
  its foot where the navigation was.
- **Detail Items:** the order type as two tiles (Dine-in, Takeaway), and
  for dine-in the table: *Pilih meja* as an outline button with *Opsional*
  at its end, or, once picked, a `primary-container` tile with a `primary`
  border, *Meja A1*, *Ganti* and a close button — or, where the outlet
  seats its customers by number stands, the stand's number: a text field
  labelled *Nomor papan* with a `#` before it, in capitals as it is typed,
  *Wajib untuk dine-in* as its helper, and the format as its error once the
  cashier leaves it; each
  line with its thumbnail, name, category, *2 × Rp 18.000* in
  `primary-strong`, the stepper (an outlined minus, a filled plus), *Catatan*
  for the line's note, and the trash icon; *Sisa stok N* at the stock's
  end. Then the voucher: a *Voucher* field with *Pakai* beside it, level
  with the field's box, and a refused code's reason as the field's error;
  once taken, a `primary-container` tile with a `primary` border, the code,
  its name when it has one, and a close button, and short of its minimum
  spend a `warning-container` line saying how much it needs, while Pay is
  off. Then the summary, the discount as *Potongan (KODE)*, a dashed rule,
  the total in headline-md, the payment tiles (Tunai chosen; QRIS and Debit
  greyed, *Segera hadir*) and the pay button, pinned at the foot while the
  rest scrolls.
- **What changed** — a price, the stock, the rates, the method — is a
  `warning-container` box above the menus, and on the order full screen,
  until dismissed; a screen reader announces it.
- **Paying in cash** is a white dialog, 16dp from a phone's edges: the
  total, the cash received with `Rp` in front and its digits grouped as
  typed, the quick amounts (*Uang pas*, 50.000, 100.000, off below the
  total — each on one line, smaller rather than broken in two), and the
  change at the line's end, or what is short in the error colours. Without an answer it says so, with *Kirim ulang*
  and *Batalkan transaksi ini*; once taken, it shows the change and the
  receipt, and *Transaksi baru*.
- **The receipt** is a paper-white card at most 300dp wide — a 58 mm roll's
  printable width — with the outlet, a stand's number in headlineSmall
  under it for the waiter, the number on a line of its own, the time,
  cashier, type and table, the lines, the figures with dashed rules (a
  voucher's discount as *Potongan (KODE)*), and *VOID* with its reason when
  voided. Each label and its value share a
  line, the value taking at most 60% of it and wrapping beyond, so larger
  system text never runs past the edge.
- **Today's orders:** the receipt number on one line, then the time, the
  table (*Meja A1*) or the stand (*No. 12*), the item count and the
  cashier; beside them the total and the status in
  words (*Lunas* on `surface-container`, *Void* on `error-container`).
  *Muat lebih banyak* at the end, and pull to refresh.
- **One order:** its status, its receipt, and *Void transaksi* in the
  error colour for whoever may void.
- **The floor** (`FloorPanel`): a chip per area, the key, the area's grid
  on `surface-container-low` with `outline` lines, a wall as an
  `icon-muted` bar and the cashier and a door as outlined marks, and the
  tables in their shapes. A table's status is a fill, a border and an icon,
  never the colour alone: *Tersedia* `surface` with an `icon-muted` border;
  *Terisi* `primary-container` with the brand border and the people icon;
  *Nonaktif* and *Nonaktif terjadwal* `surface-container` with the block or
  the clock icon. Picked, a 3dp `primary` ring. Tables not placed are
  buttons under the layout. On a phone the layout is as wide as the
  screen, a cell 16dp at least, so a 3-cell table is a 48dp target, and it
  pans and pinch-zooms (`InteractiveViewer`, DESIGN.md), from the whole
  width to 3×. On a tablet, the tables screen and the picker fill the
  screen and the layout shows whole at once, as large as the space under
  the key allows (a cell 12dp at least; below that it pans as on a phone),
  at the start of the line like the text above it.
- **A table's sheet:** its name and area, the status chip, the seats, since
  when and how many sales while occupied, why it can't be picked when off,
  then *Pesan di meja ini* (filled) and *Kosongkan Meja* (outlined, after
  a dialog).
- **Picking a table** is the floor full screen on a phone and a dialog on a
  tablet, with only the tables the cashier can sell at as buttons.
- **A phone that can't sell yet** gets a centred column: the icon, *Perangkat
  ini belum terdaftar*, what to do, and for the Manager the name field and
  *Aktifkan perangkat ini*.

## Accessibility

What standard §10 asks, as the cashier does it:

- every icon-only control has a tooltip (the stepper's *Tambah Kopi susu*,
  the trash's *Hapus Kopi susu*, closing a notice);
- status is words, never colour alone: stock, Lunas/Void, what is short;
- the menu cards, the type and payment tiles, the category tiles and the
  notices carry their meaning for a screen reader (button, selected,
  checked in a group, live region);
- the screens are tested with the system text at 1.3×.
