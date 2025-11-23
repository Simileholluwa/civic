import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_notifications_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedNotificationsList extends _$PaginatedNotificationsList {
  final List<AppNotification> _bufferedNotifications = [];

  @override
  PagingController<int, AppNotification> build(
    NotificationTargetType? targetType,
    bool? isRead,
  ) {
    final controller = PagingController<int, AppNotification>(
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
    final prevState = state.value;

    state.value = prevState.mapItems(
      (n) => n.id == notificationId ? n.copyWith(isRead: true) : n,
    );

    ref.read(unreadNotificationsCountProvider.notifier).count =
        ref.read(unreadNotificationsCountProvider) - 1;

    final markRead = ref.read(
      markNotificationAsReadProvider,
    );

    final result = await markRead(
      MarkNotificationAsReadParams(
        notificationId,
      ),
    );

    result.fold(
      (l) {
        state.value = prevState.mapItems(
          (n) => n.id == notificationId ? n.copyWith(isRead: false) : n,
        );

        ref.read(unreadNotificationsCountProvider.notifier).count =
            ref.read(unreadNotificationsCountProvider) + 1;
      },
      (_) {},
    );
  }

  Future<void> markAllAsRead() async {
    final prevState = state.value;

    final unreadBefore = prevState.items?.where((n) => !n.isRead).length ?? 0;
    if (unreadBefore == 0) return;
    state.value = prevState.mapItems(
      (n) => n.isRead ? n : n.copyWith(isRead: true),
    );
    ref.read(unreadNotificationsCountProvider.notifier).count =
        ref.read(unreadNotificationsCountProvider) - unreadBefore;

    final markAllRead = ref.read(markAllNotificationAsReadProvider);
    final result = await markAllRead(NoParams());

    result.fold(
      (_) {
        state.value = prevState;
        ref.read(unreadNotificationsCountProvider.notifier).count =
            ref.read(unreadNotificationsCountProvider) + unreadBefore;
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

  Future<List<AppNotification>> fetchPage(int page, {int limit = 50}) async {
    final listNotifications = ref.read(getNotificationsProvider);
    final completer = Completer<List<AppNotification>>();
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

  void _handleNotification(AppNotification notif) {
    _bufferedNotifications.insert(0, notif);
    ref.read(notificationsCountProvider.notifier).count =
        _bufferedNotifications.length;
    if (!notif.isRead) {
      ref.read(unreadNotificationsCountProvider.notifier).count =
          ref.read(unreadNotificationsCountProvider) + 1;
    }
  }

  void mergeBufferedNotifications() {
    if (_bufferedNotifications.isEmpty) {
      ref.read(notificationsCountProvider.notifier).count = 0;
      return;
    }

    final current = state.value;

    if (current.pages == null || current.pages!.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [..._bufferedNotifications],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      _bufferedNotifications.clear();
      ref.read(notificationsCountProvider.notifier).count = 0;
      return;
    }

    final updatedPages = <List<AppNotification>>[
      [..._bufferedNotifications, ...current.pages!.first],
      ...current.pages!.skip(1),
    ];

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
    ref.read(notificationsCountProvider.notifier).count = 0;
    return;
  }

  Future<void> deleteNotification(int notificationId) async {
    final prevState = state.value;
    final items = prevState.items ?? [];
    final exists = items.any((n) => n.id == notificationId);
    if (!exists) return;

    final wasUnread = !items
        .firstWhere(
          (n) => n.id == notificationId,
        )
        .isRead;
    state.value = prevState.filterItems((n) => n.id != notificationId);
    if (wasUnread) {
      ref.read(unreadNotificationsCountProvider.notifier).count =
          ref.read(unreadNotificationsCountProvider) - 1;
    }

    final delete = ref.read(deleteNotificationProvider);
    final result = await delete(DeleteNotificationParams(notificationId));

    result.fold(
      (_) {
        final wasUnread =
            prevState.items?.any((n) => n.id == notificationId && !n.isRead) ??
                false;
        state.value = prevState;
        if (wasUnread) {
          ref.read(unreadNotificationsCountProvider.notifier).count =
              ref.read(unreadNotificationsCountProvider) + 1;
        }
      },
      (_) {},
    );
  }
}
