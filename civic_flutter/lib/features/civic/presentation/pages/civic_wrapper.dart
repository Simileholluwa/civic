import 'package:civic_flutter/core/api/api_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/civic/domain/entity/custom_bottom_navigation_bar.dart';
import 'package:civic_flutter/features/civic/presentation/controller/civic_controller.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/show_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';

class CivicWrapper extends StatelessWidget {
  const CivicWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      CivicController(
        client: GetIt.instance.get<ApiClient>(),
      ),
    );
    return AndroidBottomNav(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          floatingActionButton: PortalTarget(
            visible: controller.state.isExpanded.value,
            anchor: const Aligned(
              follower: Alignment(-0.55, 1),
              target: Alignment.topLeft,
              ),
            portalFollower: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.state.isExpanded.value = false;
              },
              child: const ShowOptions(),
            ),
            child: InkWell(
              onTap: () {
                controller.state.isExpanded.value =
                    !controller.state.isExpanded.value;
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TColors.primary,
                ),
                child: Icon(
                  controller.state.isExpanded.isTrue ? Icons.clear : Icons.apps,
                  size: 30,
                  color: TColors.textWhite,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                        activeIcon: Iconsax.search_normal4,
                        inactiveIcon: Iconsax.search_normal,
                        iconSize: 32,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: Iconsax.notification5,
                        inactiveIcon: Iconsax.notification,
                      ),
                      CustomBottomNavigationBarItem(
                        activeIcon: CupertinoIcons.person_alt_circle_fill,
                        inactiveIcon: CupertinoIcons.person_alt_circle,
                        iconSize: 32,
                      ),
                    ],
                  )
                : Container(),
          ),
          body: IndexedStack(
            index: controller.state.index.value,
            children: controller.state.screens,
          ),
        ),
      ),
    );
  }
}
