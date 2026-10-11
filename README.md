# maki-mobile

Android cashier app for Maki, the multi-outlet POS, for phones and tablets.

**Stack:** Flutter 3.47 · flutter_bloc · go_router · dio + a client generated
from the API contract · Drift · freezed · flutter_localizations

## Run locally

1. `flutter upgrade` (the stack needs the latest stable Flutter)
2. `cp env/example.json env/dev.json` (the defaults point at the backend on
   the development machine)
3. Start the backend in `../maki-be`, then:

```
flutter run --flavor dev --dart-define-from-file=env/dev.json
```

The Android emulator reaches the development machine at `10.0.2.2`. On a
physical device, run `adb reverse tcp:8080 tcp:8080` and set `API_BASE_URL`
to `http://localhost:8080`.

## Commands

| Command | Purpose |
| --- | --- |
| `make run` | Run the dev flavor (`make run FLAVOR=prod` for prod) |
| `make gen` | Regenerate freezed, json_serializable and Drift code |
| `make api` | Regenerate `packages/api_client` from `../maki-be/api/openapi.yaml` (needs Java 11+) |
| `make analyze` | `flutter analyze` with very_good_analysis |
| `make test` | Unit, Bloc and widget tests |
| `flutter test integration_test --flavor dev --dart-define-from-file=env/dev.json --dart-define=E2E_OWNER_USERNAME=… --dart-define=E2E_OWNER_PASSWORD=…` | The cashier on a device or emulator, against a running backend ([architecture.md](docs/architecture.md#testing)) |
| `make release` | Release APK for the prod flavor |

On Windows without `make`, run the command from the `Makefile` directly, or
install it with `winget install ezwinports.make`.

`.github/workflows/ci.yml` analyzes, tests and checks `packages/api_client`
against maki-be's contract on every push and pull request; no release APK
is built yet ([docs/deployment.md](docs/deployment.md)).

## Structure

```
lib/app/              App widget, router, locale, theme and design tokens
lib/core/             api, auth, config, utils — shared by every feature
lib/features/         one folder per feature (auth, pos): data / domain / presentation
lib/l10n/             ARB translations and the generated AppLocalizations
packages/api_client/  generated from the API contract — never edited by hand
integration_test/     the cashier on a device, against a real backend
```

Everything else is in [docs/README.md](docs/README.md).
