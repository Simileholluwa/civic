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
    return SizedBox(
      height: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
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
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).hintColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                if (index == 3) {
                  unawaited(
                    ref
                        .read(fcmServiceImplProvider)
                        .promptForPermissions(context),
                  );
                  ref
                      .read(
                        paginatedNotificationsListProvider(null, null).notifier,
                      )
                      .mergeBufferedNotifications();
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

                  if (index == 3) {
                    final notifCount = ref.watch(notificationsCountProvider);
                    if (notifCount > 0) {
                      icon = Badge(
                        label: Text('$notifCount'),
                        child: icon,
                        backgroundColor: TColors.primary,
                        textColor: Colors.white,
                      );
                    }
                  }

                  return BottomNavigationBarItem(
                    icon: icon,
                    label: '',
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
