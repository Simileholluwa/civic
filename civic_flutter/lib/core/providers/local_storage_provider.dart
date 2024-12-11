import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_storage_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorage localStorage(Ref ref) {
  return LocalStorageImpl();
}