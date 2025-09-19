// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NotificationsCard extends ConsumerWidget {
  const NotificationsCard({
    super.key,
    required this.notification,
  });

  final cc.Notification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      userNotificationStreamProvider(
        this.notification.id!,
        this.notification,
      ),
    );
    final notification = data.value ?? this.notification;
    final notificationNotifier = ref.read(
      notifProvider.notifier,
    );
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
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
  }
}
