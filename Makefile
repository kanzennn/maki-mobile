# Commands shared by every Flutter app in the workspace (architecture
# standard §15). On Windows, install GNU make (`winget install
# ezwinports.make`) or run the commands directly.

FLAVOR  ?= dev
OPENAPI := npx --yes @openapitools/openapi-generator-cli@2.41.0

.PHONY: get gen api analyze test run release

get: ## Resolve dependencies and generate AppLocalizations
	flutter pub get

gen: ## Regenerate freezed, json_serializable and Drift code
	dart run build_runner build --delete-conflicting-outputs

api: ## Regenerate packages/api_client from ../maki-be/api/openapi.yaml (needs Java 11+)
	rm -rf packages/api_client
	$(OPENAPI) generate -i ../maki-be/api/openapi.yaml -g dart-dio \
		-o packages/api_client -c openapi-generator.yaml -t openapi-templates
	cd packages/api_client && dart pub get && dart run build_runner build --delete-conflicting-outputs
	flutter pub get

analyze: ## Static analysis and lints
	flutter analyze

test: ## Unit, Bloc and widget tests
	flutter test

run: ## Run on a device or emulator: make run FLAVOR=dev
	flutter run --flavor $(FLAVOR) --dart-define-from-file=env/$(FLAVOR).json

release: ## Release APK for the prod flavor
	flutter build apk --flavor prod --release --obfuscate \
		--split-debug-info=build/symbols --dart-define-from-file=env/prod.json
