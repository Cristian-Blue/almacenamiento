# Copilot instructions

## Project

- This is a Flutter application written in Dart. The package is `almacenamiento`; its SDK constraint is `^3.14.0`.
- The app is currently a small user-management app. Keep changes focused on the requested feature and preserve the existing user-facing behavior unless the task calls for a change.
- Read the relevant implementation and tests before editing. The README is still the default Flutter starter text, so treat the source and `pubspec.yaml` as authoritative for current project behavior and dependencies.

## Code organization

- `lib/main.dart` is the app entry point.
- `lib/presentation/` contains Flutter screens and forms.
- `lib/models/` contains data models and their map conversions.
- `lib/repository/` contains user persistence operations.
- `lib/database/` contains SQLite database initialization and schema.
- `lib/handler/` is intended for user-related handling logic; check its current implementation before relying on it.
- Put new code in the existing layer that owns its responsibility. Keep UI widgets out of database/repository code, and keep persistence details out of presentation code.

## Dart and Flutter conventions

- Follow the existing Dart style and the rules in `analysis_options.yaml`, which includes `flutter_lints`.
- Prefer sound null safety, explicit types where they improve clarity, and `const` widgets/constructors when applicable.
- Preserve the existing package imports and dependency choices. Add a dependency only when the feature needs it, and update the manifest and lockfile using Flutter's package tooling.
- Keep user-facing text consistent with the surrounding UI language; current labels are primarily Spanish, with some existing English labels.
- Keep state changes within Flutter's lifecycle. For `StatefulWidget` updates after asynchronous work, check that the state is still mounted before calling `setState`.

## Persistence

- User records are stored in SQLite through `DatabaseHelper` and `UsuarioRepository`; use these existing abstractions for user CRUD operations.
- Keep database reads and writes asynchronous, use parameterized `where` clauses with `whereArgs`, and use `UsuarioModel`'s map conversion methods when converting records.
- If changing the schema, update database creation/version handling and consider how existing on-device databases will be upgraded. Do not silently discard existing user data.

## Validation

- Format changed Dart files with `dart format`.
- Run `flutter analyze` for static analysis and `flutter test` for the test suite when relevant.
- Add or update focused tests for behavior changes. The current widget test is a generated counter smoke test and may not represent the current user-management UI; inspect and adapt it rather than assuming it describes app behavior.
- Do not edit generated files under `build/` or generated platform/plugin registrant files unless the task specifically requires platform integration.
