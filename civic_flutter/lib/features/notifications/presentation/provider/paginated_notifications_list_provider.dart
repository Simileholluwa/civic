import 'dart:async';
import 'package:civic_client/civic_client.dart' as cc;
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_notifications_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedNotificationsList extends _$PaginatedNotificationsList {
  final List<cc.Notification> _bufferedNotifications = [];

  @override
  PagingController<int, cc.Notification> build(
    cc.NotificationTargetType? targetType,
    bool? isRead,
  ) {
    final controller = PagingController<int, cc.Notification>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: fetchPage,
    );
    _listenToNewNotifications();
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<void> markAsRead(int notificationId) async {
    // 1) Snapshot current list and original item
    final currentState = state as PagingState<int, cc.Notification>;
    final currentItems = currentState.items ?? [];
    final index = currentItems.indexWhere((n) => n.id == notificationId);
    if (index == -1) return;
    final original = currentItems[index];

    // 2) Optimistic UI update using v5 helpers
    state.value = currentState.mapItems(
      (n) => n.id == notificationId ? n.copyWith(isRead: true) : n,
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

    // 5) Roll back on failure using v5 helpers
    result.fold(
      (l) {
        state.value = currentState.mapItems(
          (n) => n.id == notificationId ? original : n,
        );
      },
      (_) {},
    );
  }

  Future<void> markAllAsRead() async {
    // Snapshot current paging state for rollback
    final prevState = state.value;

    // Optimistic update: mark all items as read using v5 helper
    state.value = prevState.mapItems((n) {
      return n.isRead ? n : n.copyWith(isRead: true);
    });

    // Call the API in the background
    final markAllRead = ref.read(markAllNotificationAsReadProvider);
    final result = await markAllRead(NoParams());

    // Roll back on failure
    result.fold(
      (_) {
        state.value = prevState;
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

  Future<List<cc.Notification>> fetchPage(int page, {int limit = 50}) async {
    final listNotifications = ref.read(getNotificationsProvider);
    final completer = Completer<List<cc.Notification>>();
    final result = await listNotifications(
      GetNotificationsParams(
        page,
        limit,
        targetType: targetType,
        isRead: isRead,
      ),
    );
    result.fold((error) {
      completer.completeError(
        error.message,
      );
    }, (data) {
      completer.complete(data.results);
    });

    return completer.future;
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
    // No buffered notifications: nothing to merge
    if (_bufferedNotifications.isEmpty) {
      ref.watch(notificationsCountProvider.notifier).count =
          _bufferedNotifications.length;
      return;
    }

    final current = state.value;

    // If there are no pages yet, create the first page with buffered items
    if (current.pages == null || current.pages!.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [..._bufferedNotifications],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      _bufferedNotifications.clear();
      ref.watch(notificationsCountProvider.notifier).count =
          _bufferedNotifications.length;
      return;
    }

    // Prepend buffered items to the first page, keep the rest of the pages
    final updatedPages = <List<cc.Notification>>[
      [..._bufferedNotifications, ...current.pages!.first],
      ...current.pages!.skip(1),
    ];

    // Keep keys aligned with pages length (insert a placeholder key if needed)
    final updatedKeys = [...?current.keys];
    if (updatedKeys.length < updatedPages.length) {
      updatedKeys.insert(0, 0);
    }

    state.value = current.copyWith(
      pages: updatedPages,
      keys: updatedKeys,
      hasNextPage: current.hasNextPage,
    );

    _bufferedNotifications.clear();
    ref.watch(notificationsCountProvider.notifier).count =
        _bufferedNotifications.length;
    return;
  }

  Future<void> deleteNotification(int notificationId) async {
    // Snapshot current state for rollback
    final prevState = state.value;
    final items = prevState.items ?? [];
    final exists = items.any((n) => n.id == notificationId);
    if (!exists) return;

    // Optimistic removal using v5 helper
    state.value = prevState.filterItems((n) => n.id != notificationId);

    // Call the API in the background
    final delete = ref.read(deleteNotificationProvider);
    final result = await delete(DeleteNotificationParams(notificationId));

    // Roll back on failure
    result.fold(
      (_) {
        state.value = prevState;
      },
      (_) {},
    );
  }
}
