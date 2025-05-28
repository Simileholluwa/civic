import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  ConsumerState<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  bool _isOpen = false;
  void togglePopup() {
    setState(() => _isOpen = !_isOpen);
  }

  @override
  Widget build(BuildContext context) {
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
                  currentIndex: widget.navigatorShell.currentIndex,
                  onTap: (index) {
                    widget.navigatorShell.goBranch(
                      index,
                      initialLocation:
                          index == widget.navigatorShell.currentIndex,
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
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              children: [
                if (screenWidth > 450)
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
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onDestinationSelected: (index) {
                                    widget.navigatorShell.goBranch(
                                      index,
                                      initialLocation: index ==
                                          widget.navigatorShell.currentIndex,
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
                                      label: Text('Home'),
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
                                      widget.navigatorShell.currentIndex,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Create',
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        100,
                                      ),
                                      bottomLeft: Radius.circular(
                                        100,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 210,
                                child: NavigationRail(
                                  useIndicator: false,
                                  extended: screenWidth > 600,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onDestinationSelected: (index) {
                                    widget.navigatorShell.goBranch(
                                      index,
                                      initialLocation: index ==
                                          widget.navigatorShell.currentIndex,
                                    );
                                  },
                                  destinations: [
                                    NavigationRailDestination(
                                      icon: Icon(
                                        Iconsax.note,
                                        size: 35,
                                      ),
                                      label: Text('Project'),
                                    ),
                                    NavigationRailDestination(
                                      icon: Icon(
                                        Iconsax.calendar,
                                        size: 35,
                                      ),
                                      label: Text('Post'),
                                    ),
                                    NavigationRailDestination(
                                      icon: Icon(
                                        Iconsax.chart,
                                        size: 35,
                                      ),
                                      label: Text('Poll'),
                                    ),
                                    NavigationRailDestination(
                                      icon: Icon(
                                        Iconsax.document,
                                        size: 35,
                                      ),
                                      label: Text('Article'),
                                    ),
                                  ],
                                  selectedIndex: null,
                                ),
                              ),
                              const Divider(),
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
                Expanded(child: widget.navigatorShell),
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

class CreateContentItems extends StatelessWidget {
  const CreateContentItems({
    super.key,
    required this.itemName,
    required this.icon,
    required this.onTap,
    required this.itemCaption,
    this.textColor,
  });

  final IconData icon;
  final String itemCaption;
  final String itemName;
  final VoidCallback? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 15,
            children: [
              Icon(
                icon,
                color: textColor ?? TColors.primary,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 20,
                                color: textColor,
                              ),
                    ),
                    Text(
                      itemCaption,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15,
                            color: textColor,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
