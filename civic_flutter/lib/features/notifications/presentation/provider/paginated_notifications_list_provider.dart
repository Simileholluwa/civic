//ignore_for_file:avoid_public_notifier_properties, avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'paginated_notifications_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedNotificationsList extends _$PaginatedNotificationsList {
  final PagingController<int, Notification> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(String targetType, [bool isRead = true]) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    ref.onDispose(() {
      pagingController.dispose();
    });

    ref.listen<AsyncValue<Notification>>(
      userNotificationStreamProvider(null, null),
      (previous, next) {
        next.whenData((event) {
          log(event.toString());
          _handleNotification(event);
        });
      },
    );

    return pagingController.value.status;
  }

  void removeAllNotifications() {
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [],
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
        log(error.toString(), name: 'PaginatedNotificationList');
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: null,
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
    } catch (e) {
      log(e.toString(), name: 'PaginatedNotificationList');
      pagingController.value = PagingState(
        nextPageKey: null,
        itemList: null,
        error: e.toString(),
      );
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  void _handleNotification(Notification notif) {
    final itemList = pagingController.itemList ?? [];
    final alreadyExists = itemList.any((n) => n.id == notif.id);
    if (alreadyExists) {
      return;
    }
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [notif, ...pagingController.itemList ?? []],
    );
  }

  void removeNotificationById(int? notificationId) {
    if (pagingController.itemList != null && notificationId != null) {
      final updatedList =
          List<Notification>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.id == notificationId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}
