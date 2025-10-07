import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    required this.navigatorShell,
    super.key,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final location =
        navigatorShell.shellRouteContext.routerState.uri.toString();
    final hideBottomNav = location.contains('/project/') ||
        location.contains('/feed/') ||
        location.contains('/create/') ||
        location.contains('/network/');
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: screenWidth > 700
            ? null
            : AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset: hideBottomNav ? const Offset(0, 1) : Offset.zero,
                child: hideBottomNav
                    ? null
                    : BottomNavigationBar(
                        currentIndex: navigatorShell.currentIndex,
                        onTap: (index) {
                          navigatorShell.goBranch(
                            index,
                            initialLocation:
                                index == navigatorShell.currentIndex,
                          );
                        },
                        iconSize: 30,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        items: const [
                          BottomNavigationBarItem(
                            activeIcon: Icon(
                              Iconsax.note,
                              size: 26,
                            ),
                            icon: Icon(
                              Iconsax.note,
                              size: 26,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            activeIcon: Icon(
                              Iconsax.airdrop5,
                              size: 26,
                            ),
                            icon: Icon(
                              Iconsax.airdrop,
                              size: 26,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            activeIcon: Icon(
                              Iconsax.pen_tool5,
                              size: 26,
                            ),
                            icon: Icon(
                              Iconsax.pen_tool,
                              size: 26,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            activeIcon: Icon(
                              Iconsax.people5,
                              size: 26,
                            ),
                            icon: Icon(
                              Iconsax.people,
                              size: 26,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            activeIcon: Icon(
                              Iconsax.notification5,
                              size: 26,
                            ),
                            icon: Icon(
                              Iconsax.notification,
                              size: 26,
                            ),
                            label: '',
                          ),
                        ],
                      ),
              ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [
                if (screenWidth > 700)
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
                                      destinations: const [
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
                        child: const VerticalDivider(
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
    return SizedBox(
      width: 70,
      child: Drawer(
        child: ColoredBox(color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
