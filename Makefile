run_server:
	cd civic_server && dart bin/main.dart --apply-migrations

run_server_repair:
	cd civic_server && dart run bin/main.dart --apply-repair-migration

generate:
	cd civic_server && serverpod generate

repair:
	cd civic_server && $ serverpod create-repair-migration

repair_force:
	cd civic_server && $ serverpod create-repair-migration --force

compose:
	cd civic_server && docker compose up --build --detach

migrate_force:
	cd civic_server && serverpod create-migration --force

migrate:
	cd civic_server && serverpod create-migration

connect_adb:
	adb connect 192.168.73.93

run_app:
	cd civic_flutter && flutter run

build:
	cd civic_flutter && dart run build_runner build --delete-conflicting-outputs

