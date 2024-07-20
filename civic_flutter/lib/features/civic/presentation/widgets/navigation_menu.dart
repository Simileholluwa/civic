import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/civic/presentation/controller/civic_controller.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CivicNavigationBar extends GetView<CivicController> {
  const CivicNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          bottomNavigationBar: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: controller.state.show.isTrue
                ? controller.state.bottomBarHeight
                : 0,
            child: controller.state.show.isTrue
                ? CustomBottomNavigationBar(
                    currentIndex: controller.state.index.value,
                    onItemTapped: controller.updateIndex,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    items: [
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.home5,
                        inactiveIcon: Iconsax.home,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.activity5,
                        inactiveIcon: Iconsax.activity,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.pen_add,
                        inactiveIcon: Iconsax.edit,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.search_normal4,
                        inactiveIcon: Iconsax.search_normal,
                        iconSize: 32,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.notification5,
                        inactiveIcon: Iconsax.notification,
                      ),
                    ],
                  )
                : Container(),
          ),
          body: Obx(
            () => controller.state.screens[controller.state.index.value],
          ),
        ),
      ),
    );
  }
}
