import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedNotificationsListProvider(null, null),
    );
    final pagingNotifier = ref.read(
      paginatedNotificationsListProvider(null, null).notifier,
    );
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                ValueListenableBuilder(
                  valueListenable: pagingState,
                  builder: (context, value, child) {
                    final isEmpty = value.pages?.first.isEmpty ?? true;
                    final allRead =
                        value.pages?.first.every((notif) => notif.isRead) ??
                        true;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: isEmpty || allRead
                              ? null
                              : () {
                                  unawaited(
                                    pagingNotifier.markAllAsRead(),
                                  );
                                },
                          icon: const Icon(
                            Iconsax.card_tick_1,
                            size: 26,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await context.push(
                              '/notifications/settings',
                            );
                          },
                          icon: const Icon(
                            Iconsax.setting,
                            size: 26,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Text(
                'NOTIFICATIONS',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 25,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
                  height: 0,
                ),
              ),
            ),
          ];
        },
        body: AppInfiniteList<AppNotification>(
          pagingController: pagingState,
          canCreate: false,
          showDivider: false,
          itemBuilder: (context, notif, index) {
            return NotificationsCard(
              notification: notif,
              onTap: () async {
                unawaited(
                  pagingNotifier.markAsRead(
                    notif.id!,
                  ),
                );
                if (context.mounted) {
                  await context.push(
                    notif.actionRoute,
                  );
                }
              },
            );
          },
          onRefresh: pagingState.refresh,
        ),
      ),
    );
  }
}
