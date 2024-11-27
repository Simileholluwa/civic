import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:iconsax/iconsax.dart';

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });
  final StatefulNavigationShell navigatorShell;

  @override
  ConsumerState<AppWrapper> createState() => _CivicWrapperState();
}

class _CivicWrapperState extends ConsumerState<AppWrapper> {
  

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: AppCustomBottomNavigationBar(
          currentIndex: widget.navigatorShell.currentIndex,
          onItemTapped: (index) {
            widget.navigatorShell.goBranch(
              index,
              initialLocation: index == widget.navigatorShell.currentIndex,
            );
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.activity5,
              inactiveIcon: Iconsax.activity,
            ),
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.airdrop5,
              inactiveIcon: Iconsax.airdrop,
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
              activeIcon: Iconsax.message5,
              inactiveIcon: Iconsax.message,
              iconSize: 32,
            ),
          ],
        ),
        
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            widget.navigatorShell,
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
