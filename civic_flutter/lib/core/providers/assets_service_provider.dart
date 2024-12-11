import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assets_service_provider.g.dart';

@riverpod
AssetService assetService(Ref ref) {
  return AssetService(
    client: ref.read(clientProvider),
  );
}
