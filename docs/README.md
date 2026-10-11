# maki-mobile documentation

| Doc | Covers |
| --- | --- |
| [architecture.md](./architecture.md) | Layout, state, the session, navigation, API client, the cashier (device, catalog, order, charging without charging twice, receipts, today's orders, account), flavors, Android specifics, translations, testing |
| [design-system.md](./design-system.md) | How `Maki/DESIGN.md` maps onto the theme, and the cashier's screens at phone and tablet widths |
| [deployment.md](./deployment.md) | Flavors, building, versioning, the pipeline, and what a first release still needs (signing, distribution) |
| [security.md](./security.md) | Token storage, the cashier device, backups, local database decision, transport, who the app is for, Android permissions, what isn't built yet, checks done |

`offline.md` and `hardware.md` (thermal printer) are added when there is
something project-specific to put in them. The design source
is [`Maki/DESIGN.md`](../../DESIGN.md).

## The short version

- Follows the workspace standard in
  [`docs/flutter-architecture-standard.md`](../../../docs/flutter-architecture-standard.md);
  this project is its reference implementation.
- The product spec is
  [`Spesifikasi Fitur POS Multi-Outlet.md`](../../Spesifikasi%20Fitur%20POS%20Multi-Outlet.md).
- Bloc for state (Cubits first), go_router for navigation, one Dio instance
  shared with the generated API client.
- Signing in keeps the refresh token in secure storage and the access token
  in memory. A 401 refreshes once and retries; a user with a temporary
  password is held on the change-password screen.
- The app is for whoever may check out (`checkout.create`): a Manager, or
  staff whose role allows it. Anyone else is told so and can sign out. Dates
  show in the outlet's time zone.
- It sells on a phone its outlet's Manager activated. The device token is
  the phone's: it stays when a user signs out, and goes, with the session,
  when the outlet revokes the phone.
- The cashier charges with the server's rules for totals and a voucher's
  discount, read from the backend's shared test vectors, and never twice:
  an order is built once, with its own ID, and sent again as it was until
  it has an answer.
- A dine-in order may be at a table picked from the outlet's floor, which
  shows each table's status; the cashier releases a table once its
  customers have gone.
- Two flavors: `dev` (`com.kervzent.maki_mobile.dev`, plain HTTP allowed only
  to the development machine) and `prod` (HTTPS only).

## Known trade-offs and open items

- **The cashier is online only, in cash.** QRIS and debit show as coming
  soon. A voucher needs the server to
  check it, so it stays online-only when the offline mode comes. The order being rung
  up is memory only, so closing the app drops it, and a sale whose answer
  never came is let go of only with a warning to check today's orders.
- **The layout is arranged in the web admin.** The app shows it, a table
  in its shape and box but not turned, and doesn't change it.
- **Receipts show on screen only.** Printing to a Bluetooth thermal printer
  comes later, with `hardware.md`.
- **A revoked phone learns it at its next device check** — a sale, opening
  the cashier, or coming back to the front — and then signs out. The server
  refuses its sales from the moment it is revoked.
- **A new enum value from the server breaks an older app.** The generated
  client refuses a value it doesn't know (a new payment method, say), so
  the catalog wouldn't load. Before the server adds one, the app needs a
  minimum version, or a forced update.
- **A changed role reaches the app at the next refresh.** Permissions come
  with the account, so a role a Manager changes applies in the app after
  "Check again", a relaunch, or when an expired access token is next
  refreshed; the server applies it at once.
- **Starting needs the network.** The access token isn't stored, so a launch
  restores the session with a refresh. Without a network the sign-in screen
  shows, and the stored session is kept for the next launch. Offline
  sign-in comes with the offline work.
- **No offline mode or Drift database yet.** Drift is installed; its
  database, the outbox and the sync engine arrive with the offline work
  (standard §7).
- **Release signing isn't set up.** Release builds are signed with the debug
  key until a keystore exists; don't distribute them.
- **The generated client needs a template override.** `openapi-templates/`
  raises the generated package's Dart SDK floor to 3.8, because
  json_serializable emits syntax that the generator's stock `>=3.5.0` floor
  rejects.
- **Kotlin incremental compilation is off** (`android/gradle.properties`).
  With the project on drive D: and the Pub cache on C:, it breaks plugin
  builds on Windows.
- **`flutter_tester` sometimes crashes on the development machine.**
  Flutter 3.47.5's test process can die with an access violation
  (0xC0000005) on this Windows machine, in an empty project too. A run then
  reports `Connection closed before test suite loaded`, or tests that "did
  not complete", with no assertion failing. Run it again. A real failure
  names the expectation that failed. The longer a test file runs, the likelier
  a crash cuts it short, so the cashier's screen tests are split into four
  files.
- **sentry_flutter still applies the Kotlin Gradle Plugin.** Flutter warns
  that future versions will refuse to build such plugins; upgrade
  sentry_flutter once it moves to built-in Kotlin, before upgrading Flutter
  past that point.
