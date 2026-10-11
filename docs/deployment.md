# Deployment

How maki-mobile is built and checked, and what a first release still needs.
The workspace standard is Flutter §12 and §15; the API it talks to is
deployed as [maki-be's deployment.md](../../maki-be/docs/deployment.md) says.

## Flavors

| Flavor | Application ID | Name | Configuration |
| --- | --- | --- | --- |
| `dev` | prod's with `.dev` after it, so both install side by side | Maki Dev | `env/dev.json` |
| `prod` | the app's own | Maki | `env/prod.json` |

`env/<flavor>.json` holds `APP_ENV`, `API_BASE_URL` (production's is
`https://<domain>`, the domain the web app and the API share) and
`SENTRY_DSN`. Only `env/example.json` is in the repository; the others are
made where the app is built.

## Building

```sh
flutter run --flavor dev --dart-define-from-file=env/dev.json
make release   # flutter build apk --flavor prod --release --obfuscate
               #   --split-debug-info=build/symbols --dart-define-from-file=env/prod.json
```

The version is `pubspec.yaml`'s `version` (`1.0.0+1`): the name before the
`+`, Android's `versionCode` after it, one higher for every release.

## The pipeline

[`.github/workflows/ci.yml`](../.github/workflows/ci.yml), with maki-be
checked out beside this repository, as in development (`../maki-be`), on
every push and pull request:

1. `flutter analyze`;
2. `flutter test`, the ARB files' keys among the tests;
3. `packages/api_client` against maki-be's contract: regenerated as
   `make api` does it, then no difference in the generator's files. The
   `.g.dart` files json_serializable makes from them follow; the analyze and
   the tests use them.

A private maki-be needs the secret `MAKI_BE_TOKEN`
([maki-be's deployment.md](../../maki-be/docs/deployment.md#github)).

No release APK is built yet: it comes with its signing.

## Before the first release

- [ ] **Signing.** Release builds still use the debug keys
      (`android/app/build.gradle.kts`), so no store or phone would take a
      later build as an update of them. An upload keystore made once and kept
      outside the repository (and backed up: a lost key is a lost app), its
      `key.properties` beside the build, the `release` signing config reading
      it; in the pipeline, the keystore and its passwords as secrets.
- [ ] **Distribution:** a store, or APKs handed out; then the pipeline
      builds the release APK on a version tag.
- [ ] `env/prod.json` with production's `API_BASE_URL` and `SENTRY_DSN`; the
      symbols in `build/symbols` uploaded to Sentry and kept out of the
      repository (Flutter standard: release builds).
- [ ] `versionCode` past the last release's.
- [ ] A sale, a void and today's orders on a phone and a tablet against
      production.
