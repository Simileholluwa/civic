import 'dart:async';

import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_notifications_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedNotificationsList extends _$PaginatedNotificationsList {
  final PagingController<int, cc.Notification> pagingController =
      PagingController(firstPageKey: 1);

  final List<cc.Notification> _bufferedNotifications = [];

  @override
  PagingStatus build(cc.NotificationTargetType? targetType, bool? isRead) {
    pagingController
      ..addPageRequestListener(
        fetchPage,
      )
      ..addStatusListener((status) {
        state = status;
      });

    ref.onDispose(
      pagingController.dispose,
    );

    _listenToNewNotifications();

    return pagingController.value.status;
  }

  Future<void> markAsRead(int notificationId) async {
    // 1. Find the item and its index
    final currentList = pagingController.itemList ?? [];
    final itemIndex = currentList.indexWhere(
      (n) => n.id == notificationId,
    );

    if (itemIndex == -1) return;

    final item = currentList[itemIndex];

    // 2. Create the optimistically updated item
    final updatedItem = item.copyWith(isRead: true);

    // 3. Update the UI *immediately*
    final newList = List<cc.Notification>.from(currentList);
    newList[itemIndex] = updatedItem;

    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: newList,
    );

    // 4. Call the API in the background
    final markRead = ref.read(
      markNotificationAsReadProvider,
    );

    final result = await markRead(
      MarkNotificationAsReadParams(
        notificationId,
      ),
    );

    // 5. Roll back on failure
    result.fold(
      (l) {
        // Put the original item back
        newList[itemIndex] = item;
        pagingController.value = PagingState(
          nextPageKey: pagingController.nextPageKey,
          itemList: newList,
        );
      },
      (_) {},
    );
  }

  Future<void> markAllAsRead() async {
    final currentList = pagingController.itemList ?? [];

    // 1. Create the new list with all items marked as read
    final newList = currentList
        .map(
          (notif) => notif.isRead
              ? notif
              : notif.copyWith(
                  isRead: true,
                ),
        )
        .toList();

    // 2. Update the UI *immediately*
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: newList,
    );

    // 3. Call the API in the background
    final markAllRead = ref.read(markAllNotificationAsReadProvider);
    final result = await markAllRead(NoParams());

    // 4. Roll back on failure
    result.fold(
      (l) {
        pagingController.value = PagingState(
          nextPageKey: pagingController.nextPageKey,
          itemList: currentList,
        );
      },
      (_) {},
    );
  }

  void _listenToNewNotifications() {
    final userId = ref
        .read(
          localStorageProvider,
        )
        .getInt(
          'userId',
        );
    final sub = ref
        .read(clientProvider)
        .notification
        .newNotificationUpdates(userId!)
        .listen(_handleNotification);

    ref.onDispose(
      sub.cancel,
    );
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    try {
      final listNotifications = ref.read(getNotificationsProvider);
      final result = await listNotifications(
        GetNotificationsParams(
          page,
          limit,
          targetType: targetType,
          isRead: isRead,
        ),
      );
      result.fold((error) {
        pagingController.value = PagingState(
          error: error.message,
        );
      }, (data) {
        if (data.canLoadMore) {
          pagingController.appendPage(
            data.results,
            data.page + 1,
          );
        } else {
          pagingController.appendLastPage(data.results);
        }
      });
    } on Exception catch (e) {
      pagingController.value = PagingState(
        error: e.toString(),
      );
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  void _handleNotification(cc.Notification notif) {
    _bufferedNotifications.insert(0, notif);
    ref
        .watch(
          notificationsCountProvider.notifier,
        )
        .count = _bufferedNotifications.length;
  }

  void mergeBufferedNotifications() {
    if (pagingController.itemList == null) {
      _bufferedNotifications.clear();

      ref
          .watch(
            notificationsCountProvider.notifier,
          )
          .count = _bufferedNotifications.length;
      return;
    }
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [
        ..._bufferedNotifications,
        ...pagingController.itemList ?? [],
      ],
    );

    _bufferedNotifications.clear();

    ref
        .watch(
          notificationsCountProvider.notifier,
        )
        .count = _bufferedNotifications.length;
    return;
  }

  Future<void> deleteNotification(int notificationId) async {
    // 1. Get the current list and store it for rollback
    final currentList = pagingController.itemList ?? [];
    final originalList = List<cc.Notification>.from(currentList);

    // 2. Create the new optimistic list
    final newList = List<cc.Notification>.from(currentList)
      ..removeWhere((notif) => notif.id == notificationId);

    // Check if anything was actually removed
    if (newList.length == originalList.length) {
      return;
    }

    // 3. Update the UI *immediately*
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: newList,
    );

    // 4. Call the API in the background
    final delete = ref.read(deleteNotificationProvider);
    final result = await delete(
      DeleteNotificationParams(
        notificationId,
      ),
    );
    result.fold(
      (l) {},
      (_) {},
    );
  }
}
