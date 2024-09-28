import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/services/location_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service_provider.g.dart';

@Riverpod(keepAlive: true)
LocationServices locationService(LocationServiceRef ref) {
  return LocationServices(
    client: ref.read(clientProvider),
  );
}
