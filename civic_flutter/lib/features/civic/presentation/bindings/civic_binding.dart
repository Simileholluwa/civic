import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/features/civic/presentation/controller/civic_controller.dart';
import 'package:get/get.dart';

class CivicBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CivicController(
        client: Get.find<ApiClient>(),
      ),
    );
  }
}
