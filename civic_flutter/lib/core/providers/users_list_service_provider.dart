import 'dart:developer';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_client/civic_client.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'users_list_service_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
UsersListService usersListService(UsersListServiceRef ref) {
  return UsersListService(
    client: ref.read(clientProvider),
  );
}

@Riverpod(keepAlive: true)
class UsersList extends _$UsersList {
  final PagingController<int, UserRecord> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(String query) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int page, {int limit = 10}) async {
    const debounceDuration = Duration(milliseconds: 1000);
    final completer = Completer<List<UserRecord>?>();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () async {
      try {
        final result = await ref.watch(usersListServiceProvider).listUsers(
              query: query,
              page: page,
              limit: limit,
            );

        result.fold((error) {
          log(error);
          completer.completeError(error);
          return;
        }, (data) {
          if (data.canLoadMore) {
            pagingController.appendPage(
              data.results,
              data.page + 1,
            );
          } else {
            pagingController.appendLastPage(data.results);
          }
          completer.complete();
          return;
        });
      } catch (e) {
        completer.completeError(e);
      }
    });

    return;
  }

  void refresh() {
    pagingController.refresh();
  }
}

@Riverpod(keepAlive: true)
class SearchUsersListQuery extends _$SearchUsersListQuery {
  @override
  String build() => '';

  void setSearchQuery(String query) {
    state = query;
  }
}

