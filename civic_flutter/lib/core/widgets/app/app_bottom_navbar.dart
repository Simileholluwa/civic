import 'dart:async';
import 'dart:ui';

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppBottomNavbar extends ConsumerWidget {
  const AppBottomNavbar({
    required this.navigatorShell,
    super.key,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: .8,),
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: BottomNavigationBar(
              currentIndex: navigatorShell.currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              unselectedItemColor: Theme.of(context).hintColor,
              selectedFontSize: 12,
              onTap: (index) {
                if (index == 3) {
                  unawaited(
                    ref
                        .read(fcmServiceImplProvider)
                        .promptForPermissions(context),
                  );
                }

                navigatorShell.goBranch(
                  index,
                  initialLocation: index == navigatorShell.currentIndex,
                );
              },
              items: List.generate(
                5,
                (index) {
                  Widget icon = Icon(
                    [
                      Iconsax.note,
                      Iconsax.airdrop,
                      Iconsax.people5,
                      Iconsax.notification5,
                      Iconsax.edit_25,
                    ][index],
                  );

                  final label = [
                    'Projects',
                    'Social',
                    'People',
                    'Updates',
                    'Create',
                  ][index];

                  if (index == 3) {
                    final notifCount = ref.watch(
                      unreadNotificationsCountProvider,
                    );
                    if (notifCount > 0) {
                      final display = notifCount > 99 ? '99+' : '$notifCount';
                      icon = Badge(
                        label: Text(
                          display,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: icon,
                        backgroundColor: TColors.primary,
                        textColor: Colors.white,
                      );
                    }
                  }
                  return BottomNavigationBarItem(
                    icon: icon,
                    label: label,
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}
