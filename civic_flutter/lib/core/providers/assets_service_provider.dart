import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/services/asset_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assets_service_provider.g.dart';

@riverpod
AssetService assetService(AssetServiceRef ref) {
  return AssetService(
    client: ref.read(clientProvider),
  );
}
