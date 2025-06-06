import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isBottomNavVisible = ref.watch(
      appBottomNavigationVisibilityProvider(
        null,
      ),
    );
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: screenWidth > 450
            ? null
            : AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isBottomNavVisible ? 60 : 0,
                child: BottomNavigationBar(
                  currentIndex: navigatorShell.currentIndex,
                  onTap: (index) {
                    navigatorShell.goBranch(
                      index,
                      initialLocation: index == navigatorShell.currentIndex,
                    );
                  },
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Icon(Iconsax.airdrop5),
                        icon: Icon(Iconsax.airdrop),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.add,
                        ),
                        icon: Icon(
                          Iconsax.magicpen,
                        ),
                        label: 'Create'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(Iconsax.notification5),
                        icon: Icon(Iconsax.notification),
                        label: 'Updates'),
                  ],
                ),
              ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [
                if (screenWidth > 450)
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 170,
                                    child: NavigationRail(
                                      useIndicator: false,
                                      extended: screenWidth > 600,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      onDestinationSelected: (index) {
                                        navigatorShell.goBranch(
                                          index,
                                          initialLocation: index ==
                                              navigatorShell.currentIndex,
                                        );
                                      },
                                      destinations: [
                                        NavigationRailDestination(
                                          selectedIcon: Icon(
                                            Iconsax.airdrop5,
                                            size: 35,
                                            color: TColors.primary,
                                          ),
                                          icon: Icon(
                                            Iconsax.airdrop,
                                            size: 35,
                                          ),
                                          label: Text('Feed'),
                                        ),
                                        NavigationRailDestination(
                                          selectedIcon: Icon(
                                            Iconsax.magicpen5,
                                            size: 35,
                                          ),
                                          icon: Icon(
                                            Iconsax.magicpen,
                                            size: 35,
                                          ),
                                          label: Text('Create'),
                                        ),
                                        NavigationRailDestination(
                                          selectedIcon: Icon(
                                            Iconsax.notification5,
                                            size: 35,
                                          ),
                                          icon: Icon(
                                            Iconsax.notification,
                                            size: 35,
                                          ),
                                          label: Text('Updates'),
                                        ),
                                      ],
                                      selectedIndex:
                                          navigatorShell.currentIndex,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight,
                        child: VerticalDivider(
                          width: 1,
                        ),
                      ),
                    ],
                  ),
                Expanded(child: navigatorShell),
              ],
            ),
            Visibility(
              visible: ref.watch(sendPostLoadingProvider),
              child: LinearProgressIndicator(
                color: TColors.primary,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isCollapsed = true;
    //final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: isCollapsed == false ? 250 : 70,
      child: Drawer(
        child: ColoredBox(color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
