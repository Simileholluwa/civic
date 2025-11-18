import 'dart:async';

import 'package:civic_client/civic_client.dart' as cc;
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
    final notifState = ref.watch(notifProvider);
    final pagingState = ref.watch(
      paginatedNotificationsListProvider(
        notifState.targetType,
        notifState.unread,
      ),
    );
    final pagingNotifier = ref.read(
      paginatedNotificationsListProvider(
        notifState.targetType,
        notifState.unread,
      ).notifier,
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
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: isEmpty
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
                          onPressed: isEmpty ? null : () {},
                          icon: const Icon(
                            Iconsax.setting_3,
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
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NOTIFICATIONS',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
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
        body: AppInfiniteList<cc.Notification>(
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
