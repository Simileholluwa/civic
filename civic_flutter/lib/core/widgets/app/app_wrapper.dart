import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:iconsax/iconsax.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });
  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(appScrollVisibilityProvider);
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: isVisible ? Offset.zero : const Offset(0, 1),
          child: SizedBox(
            height: isVisible ? 65 : 0,
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
                    activeIcon: Icon(Iconsax.search_normal4),
                    icon: Icon(Iconsax.search_normal),
                    label: 'Discover'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Iconsax.notification5),
                    icon: Icon(Iconsax.notification),
                    label: 'Updates'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Iconsax.receipt_15),
                    icon: Icon(Iconsax.receipt),
                    label: 'Learn'),
              ],
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            navigatorShell,
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
