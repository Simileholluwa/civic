import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_list_service_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
UsersListService usersListService(Ref ref) {
  return UsersListService(
    client: ref.read(clientProvider),
  );
}

@Riverpod(keepAlive: true)
class PaginatedUsersList extends _$PaginatedUsersList {
  @override
  PagingController<int, UserRecord> build(String query) {
    final controller = PagingController<int, UserRecord>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: fetchPage,
    );
    ref.onDispose(() {
      controller.dispose();
      _debounce?.cancel();
    });
    return controller;
  }

  Future<List<UserRecord>> fetchPage(int pageKey, {int limit = 50}) async {
    const debounceDuration = Duration(milliseconds: 1000);
    final completer = Completer<List<UserRecord>>();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () async {
      final result = await ref.watch(usersListServiceProvider).listUsers(
            query: query,
            page: pageKey,
            limit: limit,
          );

      result.fold(completer.completeError, (data) {
        completer.complete(data.results);
      });
    });

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
class SearchUsersListQuery extends _$SearchUsersListQuery {
  @override
  String build() => '';

  set setSearchQuery(String query) {
    state = query;
  }
}
