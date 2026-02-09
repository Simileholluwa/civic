import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_review_list_provider.g.dart';

Timer? _debounceTimer;

@Riverpod(keepAlive: true)
class PaginatedProjectReviewList extends _$PaginatedProjectReviewList {
  @override
  Raw<PagingController<int, ProjectReviewWithUserState>> build(int projectId) {
    final controller = PagingController<int, ProjectReviewWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(projectId, pageKey),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<ProjectReviewWithUserState>> _fetchPage(
    int projectId,
    int pageKey, {
    int limit = 50,
  }) async {
    const debounceDuration = Duration(milliseconds: 300);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    final completer = Completer<List<ProjectReviewWithUserState>>();
    _debounceTimer = Timer(debounceDuration, () async {
      final usecase = ref.read(getProjectReviewsProvider);
      final query = ref.watch(projectReviewListQueryProvider);

      final result = await usecase(
        GetProjectReviewsParams(
          projectId,
          pageKey,
          limit,
          query.rating,
          query.cardinal,
        ),
      );
      result.fold(
        completer.completeError,
        (data) => completer.complete(data.results),
      );
    });
    return completer.future;
  }

  void addReview(ProjectReviewWithUserState reviewWithUserState) {
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [reviewWithUserState],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }
    if (pages.first.any((r) => r.review.id == reviewWithUserState.review.id)) {
      state.value = current.mapItems(
        (r) => r.review.id == reviewWithUserState.review.id
            ? reviewWithUserState
            : r,
      );
      return;
    }
    final updatedFirst = [reviewWithUserState, ...pages.first];
    final updatedPages = [updatedFirst, ...pages.skip(1)];
    final updatedKeys = [...?current.keys];
    if (updatedKeys.length < updatedPages.length) {
      updatedKeys.insert(0, 0);
    }
    state.value = current.copyWith(
      pages: updatedPages,
      keys: updatedKeys,
      hasNextPage: current.hasNextPage,
    );
  }

  void deleteReview(int reviewId) {
    final prev = state.value;
    state.value = prev.filterItems((r) => r.review.id != reviewId);
  }
}

@Riverpod(keepAlive: true)
class ProjectReviewListQuery extends _$ProjectReviewListQuery {
  @override
  ProjectReviewQueryState build() => ProjectReviewQueryState();

  void setQuery(Map<String, dynamic> query) {
    state = state.copyWith(
      rating: query['rating'] as double?,
      cardinal: query['cardinal'] as String?,
      sortby: query['sortBy'] as String?,
      sortDir: query['sortDir'] as String?
    );
  }

  void clearQuery() {
    state = ProjectReviewQueryState();
  }
}
