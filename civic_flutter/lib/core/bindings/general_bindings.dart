import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<AppLocalStorage>(
      () => AppLocalStorage().init(),
      permanent: true,
    );
    Get.put<ApiClient>(
      ApiClientImpl(),
      permanent: true,
    );

    await Get.find<ApiClient>().init();
  }
}
