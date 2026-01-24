## AI Coding Agents: Civic Monorepo Guide

This repo contains three Dart projects wired together via Serverpod.

- Architecture:
  - `civic_server/`: Serverpod backend. Endpoints under `lib/src/endpoints/**`, models in `lib/src/generated/protocol.dart`, background work in `lib/src/future_calls/**`, services in `lib/src/services/**`.
  - `civic_client/`: Generated Serverpod client consumed by the app. Exported via `lib/civic_client.dart`, generated endpoint refs in `lib/src/protocol/client.dart`.
  - `civic_flutter/`: Flutter app using Riverpod 3, GoRouter, and Firebase. Core exports in `lib/core/core.dart`. Features live in `lib/features/<domain>/{data,domain,presentation}`.

- How components communicate:
  - Server endpoints (e.g., `user_record_endpoint.dart`, `post_endpoint.dart`) become callable methods on the generated client (e.g., `client.userRecord.getUser`, `client.post.savePost`).
  - App bootstraps `Client` with `Env.apiBaseUrl` and `FlutterAuthenticationKeyManager` in `core/providers/api_client_provider.dart`. Auth flows use Serverpod Email auth (`EmailAuthController`).
  - Push: FCM token management in `core/services/fcm_services.dart` calls `client.userRecord.registerDeviceToken`.

- Local dev workflow (Windows PowerShell):
  - Start DB & Redis: `cd civic_server; docker compose up --build --detach` (Ports: Postgres 8090→5432, Redis 8091→6379).
  - Create migrations after changing models: `cd civic_server; serverpod create-migration` (use `--force` if needed). Registry lives in `migrations/migration_registry.txt`.
  - Generate code (server+client): `cd civic_server; serverpod generate` (updates server `generated/` and client `civic_client/src/protocol`).
  - Run server (auto-apply migrations): `cd civic_server; dart bin/main.dart --apply-migrations`.
  - Flutter Riverpod codegen: `cd civic_flutter; dart run build_runner build --delete-conflicting-outputs`.
  - Run app: `cd civic_flutter; flutter run`. Configure API base URL via `assets/env/dev_env` loaded by `core/config/env.dart`.

- Server specifics worth knowing:
  - Entry: `bin/main.dart` calls `run(args)` in `lib/server.dart`. Web routes configured under `src/web`, static served from `/static`.
  - Auth: `server.dart` sets `auth.AuthConfig`. Email handlers currently stubbed to `print(validationCode)`; update if real email is needed.
  - Background jobs: `SchedulePostFutureCall` and `ScheduleProjectFutureCall` registered in `server.dart` (retry with `futureCallWithDelay` on failures).
  - Storage: Public S3 via `serverpod_cloud_storage_s3` with `storageId: 'public'` and bucket `civic-development`.
  - Database access: Use generated `.db` helpers (e.g., `Post.db.insertRow`, `UserRecord.db.findFirstRow`) and wrap multi-step writes in `session.db.transaction`.

- Client/app conventions:
  - State mgmt: Riverpod 3 with `@Riverpod`/`@riverpod` annotations; always run build_runner after changing providers. Generated files live next to sources as `*.g.dart`.
  - Boot: `main.dart` calls `Env.init()` (loads `assets/env/{dev_env,prod_env}`), `Firebase.initializeApp`, then provides `ProviderScope`. Initial app setup in `core/providers/initial_dependencies_provider.dart`.
  - Feature structure: `lib/features/<domain>/{data,domain,presentation}`. Remote datasources call the generated client (see `features/auth/data/datasources/auth_remote_datasource.dart`).

- Deployment pointers:
  - `render.yaml` builds from `civic_server/Dockerfile`. Container starts `nginx` and the compiled server via `supervisord`. Ports 8080 (API), 8081 (Insights), 8082 (Web).

- Practical examples:
  - Calling an endpoint from Flutter: `final user = await ref.read(clientProvider).userRecord.getUser(null);`
  - Adding a new endpoint: create `lib/src/endpoints/foo_endpoint.dart`, implement `class FooEndpoint extends Endpoint { ... }`, update models, run `serverpod create-migration` (if DB changes), then `serverpod generate`; call from Flutter with `client.foo.<method>()`.

- Gotchas:
  - Ensure `Env.apiBaseUrl` matches the server `apiServer` public host/port in `config/development.yaml`. Example dev value lives in `civic_flutter/assets/env/dev_env`.
  - After changing `@Riverpod`-annotated code, re-run build_runner to avoid missing `*.g.dart`.
  - `Makefile` has useful targets (`run_server`, `generate`, `migrate`, `compose`, `run_app`, `build`). Note: `repair` targets contain a stray `$` before `serverpod`.

If any of the above is unclear or missing (e.g., exact email delivery setup, additional environments, or S3 credentials flow), tell me what to clarify and I’ll refine this guide.
