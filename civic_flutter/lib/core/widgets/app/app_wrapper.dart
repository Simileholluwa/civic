import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    required this.navigatorShell,
    super.key,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const mainTabLocations = [
      '/project',
      '/feed',
      '/network',
      '/notifications',
      '/create',
    ];
    final location =
        navigatorShell.shellRouteContext.routerState.uri.toString();
    final isMainTab = mainTabLocations.contains(location);
    final bottomNavVisible = ref.watch(bottomNavVisibilityProvider);
    final showBottomNav = isMainTab && bottomNavVisible;
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Stack(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: !showBottomNav
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                secondChild: const SizedBox.shrink(),
                firstChild: AppBottomNavbar(
                  navigatorShell: navigatorShell,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
