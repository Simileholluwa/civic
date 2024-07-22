import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/civic/presentation/controller/civic_controller.dart';
import 'package:civic_flutter/core/widgets/civic_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends GetView<CivicController> {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: ScrollToHideAppBar(
          controller: controller.state.animationController,
          visible: controller.state.showAppbar.value,
          toolBarHeight: TDeviceUtils.getAppBarHeight(),
          title: Text(
            'civic',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  color: TColors.primary,
                ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.user,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.sm - 2,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.search_normal,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              controller.logout();
              Get.offAllNamed<dynamic>(AppRoutes.authLandingScreen);
            },
            child: const Text(
              'Logout',
            ),
          ),
        ),
      ),
    );
  }
}
