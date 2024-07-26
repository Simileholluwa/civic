import 'dart:developer';

import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:get_it/get_it.dart';

Future<void> initialDependencies() async {
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<AppLocalStorage>(
    () => AppLocalStorage().init(),
  );
  getIt.registerSingleton<ApiClient>(
    ApiClientImpl(),
  );

  await getIt<ApiClient>().init();
  await getIt.allReady();

  log("ALL INITIALIZED");
}
