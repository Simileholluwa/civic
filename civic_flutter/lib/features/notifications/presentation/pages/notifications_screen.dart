// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(notificationTabControllerProvider);
    final notifNotifier = ref.read(notifProvider.notifier);
    final pagingController = ref.watch(
      paginatedNotificationsListProvider('').notifier,
    );
    final isEmpty = pagingController.pagingController.itemList?.isEmpty ?? true;

    return Scaffold(
      body: ContentScrollWrapper(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 60,
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
                  const SizedBox(
                    width: 5,
                  ),
                ],
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'NOTIFICATIONS',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 25,
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21, left: 1),
                      child: AppDecorationDot(),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(65),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(13, 0, 15, 15),
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: AppTabBarDesign(
                          height: 35,
                          tabController: tabController,
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.fill,
                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          activeColor: Colors.white,
                          tabs: [
                            Tab(text: 'ALL'),
                            Tab(text: 'UNREAD'),
                            Tab(text: 'PROJECT'),
                            Tab(text: 'SOCIAL'),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              NotificationCard(
                targetType: '',
              ),
              NotificationCard(
                targetType: '',
                isRead: false,
              ),
              NotificationCard(
                targetType: 'project',
              ),
              NotificationCard(
                targetType: 'post',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends ConsumerWidget {
  const NotificationCard({
    super.key,
    required this.targetType,
    this.isRead = true,
  });

  final String targetType;
  final bool isRead;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier = ref.watch(
      paginatedNotificationsListProvider(targetType, isRead).notifier,
    );
    final notificationNotifier = ref.read(
      notifProvider.notifier,
    );
    return AppInfiniteList<cc.Notification>(
      pagingController: pagingControllerNotifier.pagingController,
      canCreate: false,
      itemBuilder: (context, notif, index) {
        final data = ref.watch(
          userNotificationStreamProvider(
            notif.id!,
            notif,
          ),
        );
        final notification = data.value ?? notif;
        return InkWell(
          onTap: () async {
            notificationNotifier.markAsRead(
              notification.id!,
            );
            context.push(
              notification.actionRoute,
            );
          },
          child: ColoredBox(
            color: notification.isRead
                ? Colors.transparent
                : Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 15,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                          notification.mediaThumbnailUrl,
                        ),
                      ),
                      Positioned(
                        right: -5,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: NotificationsHelper.getIconColor(
                              notification.actionType,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: NotificationsHelper.notifIcon(
                              notification.actionType,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        RichText(
                          text: NotificationsHelper.formatNotificationRichText(
                            context,
                            content: notification.content,
                            usernames: notification.groupedSenderNames!,
                            actionType: notification.actionType,
                            targetType: notification.targetType,
                            triggerUser: notification.triggerUser,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          DateFormat('hh:mm a • MMM d, y')
                              .format(notification.createdAt),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
