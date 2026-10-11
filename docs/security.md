# Security

How maki-mobile applies §9 of the
[Flutter standard](../../../docs/flutter-architecture-standard.md). The
server's side of the same flows is in
[maki-be's security.md](../../maki-be/docs/security.md).

## Tokens and credentials

| What | Kept in | Notes |
| --- | --- | --- |
| Access token | Memory only, in `SessionCubit` | Every launch starts with a refresh |
| Refresh token | `flutter_secure_storage` behind `TokenStorage`: AES-GCM, with its key wrapped by the Android Keystore | Replaced on every refresh; deleted by sign-out, or when the server refuses it |
| Device token | The same storage, under a key of its own, behind `DeviceTokenStorage`; read once at startup into `DeviceTokenStore` | Proves the phone is one of its outlet's cashier devices; sent as `X-Device-Token`; kept by sign-out; deleted when the backend says the device is revoked ([below](#cashier-device)) |
| Password | Nowhere | The sign-in form clears the field after a failed attempt |

- A stored value the Keystore can no longer decrypt is wiped, and the user
  signs in again. That's the package's `resetOnError` default, and it keeps
  the app from failing at startup.
- A refresh that fails for lack of network keeps the token: nothing says the
  session has ended.
- Offline sign-in (a verifier derived on the device, standard §9) comes with
  the offline work. Until then, starting without a network shows the sign-in
  screen, and the next launch with a network restores the session.

## Cashier device

What the backend's device token means for the phone (the server's side is
in [maki-be's security.md](../../maki-be/docs/security.md#cashier-devices)):

- **Activation** is the outlet's Manager's, signed in on the phone itself:
  the server refuses anyone else. The answer carries the token in its body
  (`platform: android`), which goes straight to secure storage and then
  into memory; nothing logs or shows it.
- **Every API request carries it** as `X-Device-Token`, as the browser's
  `HttpOnly` cookie covers all of `/api/v1`; only the cashier's routes read
  it. The Dio instance only ever talks to the configured API.
- **It is the phone's, not the user's.** Signing out deletes the refresh
  token only, so the next cashier sells on the same till.
  `SecureTokenStorage.clear()` used to call `deleteAll()`, which would have
  taken the device token with it; it deletes its own key now, and a test
  holds it to that.
- **Revoked, the phone keeps nothing** (standard §9). A `device_revoked`
  answer to any request deletes the device token and ends the session,
  on the server too: the session of whoever is signed in on a lost phone
  could still read today's orders, or void them, which need no device. The
  sign-in screen says why. The phone learns it at its next contact with a
  device check: a sale, opening the cashier, or coming back to the front.
  The server refuses its sales from the moment it is revoked.
- **Not registered isn't revoked.** `device_not_registered` — a token of
  another outlet, say — keeps the token: that outlet can still revoke it,
  and activating the phone here replaces it.
- **The order being rung up stays in memory**, never on disk; signing out
  drops it, after asking. Receipts show on screen only.

## Backups and device transfers

Off. `android:allowBackup="false"` covers Android 11 and older.
`res/xml/data_extraction_rules.xml` excludes everything from cloud backup and
from device-to-device transfer on Android 12 and newer, where `allowBackup`
alone doesn't stop transfers on every device. Two reasons:

- The secure storage can't be restored anyway, since its Keystore key never
  leaves the device.
- A till's local state must never be cloned onto another device: its
  session and its device token, and later its unsynced orders.

## Local database

None yet: Drift is installed, but no database exists. Whether to encrypt it
with SQLCipher is decided with the offline work, when it will hold the menu,
orders and the outbox. Credentials stay in secure storage either way.

## Transport

- `prod`: HTTPS only. `usesCleartextTraffic="false"`, and no network security
  exception.
- `dev`: the flavor's `network_security_config.xml` allows plain HTTP to
  `10.0.2.2` (the emulator's view of the development machine) and
  `localhost` (a device after `adb reverse`), and nothing else.
- No `badCertificateCallback`, and no other trust override.

## Who the app is for

The cashier app is for whoever may check out: a Manager, or staff whose
role holds `checkout.create`. The Owner, and staff without that permission,
can sign in — the server has no per-app login — but the router holds them
on a screen that says so, with sign-out
([architecture.md](./architecture.md#navigation)). They reach no screen
whose calls the server would refuse anyway. The permissions come with the
account from `GET /me` and each refresh, so a role changed by a Manager
reaches the app at the next refresh ("Check again", or a relaunch). The
backend enforces every permission on every request regardless of what the
app shows.

## Android permissions

`INTERNET`, declared by the app itself rather than left to a plugin. The
merged manifest also carries androidx's
`DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION`, which is private to the app.

## Secrets, logs and errors

- No secrets in the app: `env/<flavor>.json` holds public config
  (`API_BASE_URL`, `SENTRY_DSN`).
- Nothing logs requests, tokens or passwords: there's no Dio log
  interceptor, and no `print` or `debugPrint` in `lib/`.
- Screens show `apiErrorMessage`: the translation of the error code, or the
  server's own message. They never show exception text or a stack trace.

## Not built yet

- Offline sign-in, and the local database decision above.
- Printing receipts: a Bluetooth printer is a new hardware integration, so
  it comes with a re-audit (standard §9).
- Release signing and Sentry symbol upload; see
  [README.md](./README.md#known-trade-offs-and-open-items).

## Checks done

On 2026-09-30, on an Android 15 emulator against the real maki-be binaries
on a throwaway schema:

- A wrong password was refused, and the password field was cleared.
- A temporary password led to the change-password screen.
- With the API restarted on a new `JWT_SECRET`, the app refreshed and
  retried the request.
- Relaunching and reinstalling restored the session from secure storage.
- Signing out ended the session on the server, and a relaunch then made no
  request.

The merged release manifest was checked too: `INTERNET` comes from the app,
backups are off, the extraction rules are present, and there's no cleartext.

For permissions, on the same kind of setup:

1. A Manager opened the cashier, with the outlet and today's date there.
2. Staff whose role can't check out got the no-access screen, and so did the
   Owner.
3. After a Manager gave the staff member's role that permission through the
   API, Check again moved on to the password change that was still due.
4. Signing out from that screen worked.

For the cashier, on 2026-10-01, `integration_test/cashier_test.dart` ran on
the same kind of emulator against the real maki-be binary on a throwaway
schema, in the phone layout and in a 1280×800dp tablet layout:

1. The Manager activated the phone; its token went to secure storage, and
   the next requests carried it.
2. A sale with change and its receipt took the device's first number of the
   outlet's day, and the cake's stock went down.
3. Found in today's orders, the sale was voided for a reason, and its stock
   came back.
4. The Manager signed out and the cashier signed in on the same phone: it
   was still the outlet's till, and the next sale took the next number.
5. Once the Manager revoked the phone through the API, its next sale signed
   it out, the sign-in screen said why, and its secure storage was empty.
6. Signed in again, it was a phone to activate.

