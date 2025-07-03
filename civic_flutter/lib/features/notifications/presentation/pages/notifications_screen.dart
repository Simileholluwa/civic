// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:civic_flutter/features/notifications/presentation/helpers/notifications_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier = ref.watch(
      paginatedNotificationsListProvider.notifier,
    );
    final isVisible = ref.watch(
      appScrollVisibilityProvider(
        true,
      ),
    );
    final textStyle = DefaultTextStyle.of(context).style;
    final notificationNotifier = ref.read(
      notifProvider.notifier,
    );
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
        titleSpacing: 0,
        title: const SizedBox(),
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
        ],
      ),
      body: AppInfiniteList<UserNotification>(
        pagingController: pagingControllerNotifier.pagingController,
        itemBuilder: (context, notif, index) {
          final data = ref.watch(
            userNotificationStreamProvider(
              notif.notification.id!,
              notif,
            ),
          );
          final notification = data.value ?? notif;
          return InkWell(
            onTap: () async {
              notificationNotifier.markAsRead(
                notification.notification.id!,
              );       
              context.push(
                notification.notification.actionRoute,
              );
              
            },
            child: ColoredBox(
              color: notification.notification.isRead
                  ? Colors.transparent
                  : Theme.of(context).cardColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                        notification.mediaThumbnailUrl ?? '',
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text.rich(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle,
                            TextSpan(
                              text: NotificationsHelper.formatGroupedUserNames(
                                notification.senderUsernames,
                              ),
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              
                              children: [
                                TextSpan(
                                  text: " ${notification.title}: ${notification.notification.content ?? ''}",
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            DateFormat('hh:mm a • MMM d, y')
                                .format(notification.notification.createdAt),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
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
      ),
    );
  }
}
