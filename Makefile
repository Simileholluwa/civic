run_server:
	cd civic_server && dart bin/main.dart --apply-migrations

generate:
	cd civic_server && serverpod generate

compose:
	cd civic_server && docker compose up --build --detach

migrate:
	cd civic_server && serverpod create-migration --force

connect_adb:
	adb connect 192.168.1.245

run_app:
	cd civic_flutter && flutter run

build:
	cd civic_flutter && dart run build_runner build --delete-conflicting-outputs

