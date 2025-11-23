import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    required this.notification,
    required this.onTap,
    super.key,
  });

  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isPostNotif = notification.targetType == NotificationTargetType.post;
    final isPollNotif = notification.targetType == NotificationTargetType.poll;
    final isArticleNotif =
        notification.targetType == NotificationTargetType.article;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.transparent
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                AppUserProfileImage(
                  imageUrl: notification.senderAvatarUrl ?? '',
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
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          text: NotificationsHelper.buildNotificationText(
                            context,
                            notification.title,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          timeago.format(
                            notification.createdAt,
                            locale: 'en_short',
                          ),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 4,
                        ),
                      ),
                    ),
                    child: isPostNotif
                        ? PostNotificationTarget(
                            notification: notification,
                          )
                        : isPollNotif
                            ? PollNotificationTarget(
                                notification: notification,
                              )
                            : isArticleNotif
                                ? ArticleNotificationTarget(
                                    notification: notification,
                                  )
                                : notification.targetType ==
                                        NotificationTargetType.user
                                    ? Text(
                                        notification.body!,
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                      )
                                    : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
