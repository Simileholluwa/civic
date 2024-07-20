run_server:
	cd civic_server && dart bin/main.dart --apply-migrations

generate:
	cd civic_server && serverpod generate --watch

compose:
	docker compose up --build --detach

migrate:
	serverpod create-migration

connect_adb:
	adb connect 192.168.215.62

run_app:
	cd civic_flutter && flutter run

