import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/features/civic/presentation/state/civic_state.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/show_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class CivicController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CivicController get instance => Get.find();

  CivicController({required ApiClient client}) : _client = client;

  final ApiClient _client;

  final state = CivicState();

  @override
  void onInit() {
    super.onInit();
    state.animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    myScroll();
  }

  @override
  void onClose() {
    state.scrollBottomBarController.removeListener(() {});
    state.animationController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
  }

  void showBottomBar() {
    state.show.value = true;
  }

  void hideBottomBar() {
    state.show.value = false;
  }

  void updateIndex(int index) {
    final currentIndex = state.index.value;
    if (index == 2) {
      state.index.value = currentIndex;
      showOptions();
    } else {
      state.index.value = index;
    }
  }

  Future<void> myScroll() async {
    state.scrollBottomBarController.addListener(() {
      if (state.scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!state.isScrollingDown.value) {
          state.isScrollingDown.value = true;
          state.showAppbar.value = false;
          hideBottomBar();
        }
      }
      if (state.scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (state.isScrollingDown.value) {
          state.isScrollingDown.value = false;
          state.showAppbar.value = true;
          showBottomBar();
        }
      }
    });
  }

  Future<void> logout() async {
    await _client.sessionManager.signOut();
  }
}
