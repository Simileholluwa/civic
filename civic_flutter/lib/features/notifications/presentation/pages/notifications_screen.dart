import 'dart:async';

import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifNotifier = ref.read(notifProvider.notifier);
    final pagingController = ref.watch(
      paginatedNotificationsListProvider('').notifier,
    );
    final isEmpty = pagingController.pagingController.itemList?.isEmpty ?? true;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: isEmpty
                      ? null
                      : () async {
                          await NotificationsHelper.deleteNotificationsDialog(
                            ref,
                            context,
                          );
                        },
                  icon: const Icon(
                    Iconsax.trash,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: isEmpty
                      ? null
                      : () {
                          unawaited(
                            notifNotifier.markAllAsRead(),
                          );
                        },
                  icon: const Icon(
                    Iconsax.tick_circle,
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
        body: const NotificationCard(
          targetType: '',
        ),
      ),
    );
  }
}

class NotificationCard extends ConsumerWidget {
  const NotificationCard({
    required this.targetType,
    super.key,
    this.isRead = true,
  });

  final String targetType;
  final bool isRead;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier = ref.watch(
      paginatedNotificationsListProvider(targetType, isRead).notifier,
    );
    return AppInfiniteList<cc.Notification>(
      pagingController: pagingControllerNotifier.pagingController,
      canCreate: false,
      itemBuilder: (context, notif, index) {
        return NotificationsCard(
          notification: notif,
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
