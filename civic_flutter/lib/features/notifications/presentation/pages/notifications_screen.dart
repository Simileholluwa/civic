// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:civic_flutter/features/notifications/presentation/helpers/notifications_helper.dart';
import 'package:civic_flutter/features/notifications/presentation/provider/notification_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(
      appScrollVisibilityProvider(
        true,
      ),
    );
    final tabController = ref.watch(notificationTabControllerProvider);
    return Scaffold(
      appBar: ContentAppBar(
        isVisible: isVisible,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.apps,
            size: 30,
          ),
          onPressed: () {},
        ),
        bottomHeight: 54,
        titleSpacing: 0,
        title: const SizedBox(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppTabBarDesign(
            tabController: tabController,
            showTopBorder: true,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'ALL'),
              Tab(text: 'UNREAD'),
              Tab(text: 'PROJECT'),
              Tab(text: 'SOCIAL'),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Iconsax.search_normal,
              size: 26,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: Icon(
              Iconsax.trash,
              size: 26,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: Icon(
              Iconsax.tick_circle,
              size: 26,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: Icon(
              Iconsax.setting_2,
              size: 26,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
      ),
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
