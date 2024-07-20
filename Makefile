run_server:
	cd civic_server && dart bin/main.dart --apply-migrations

generate:
	cd civic_server && serverpod generate --watch

compose:
	cd civic_server && docker compose up --build --detach

migrate:
	cd civic_server && serverpod create-migration

connect_adb:
	adb connect 192.168.58.134

run_app:
	cd civic_flutter && flutter run

