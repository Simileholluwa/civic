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
  PagingController<int, ProjectReview> build(int projectId) {
    final controller = PagingController<int, ProjectReview>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(projectId, pageKey),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<ProjectReview>> _fetchPage(
    int projectId,
    int pageKey, {
    int limit = 50,
  }) async {
    const debounceDuration = Duration(milliseconds: 300);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    final completer = Completer<List<ProjectReview>>();
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

  void addReview(ProjectReview review) {
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [review],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }
    if (pages.first.any((r) => r.id == review.id)) return;
    final updatedFirst = [review, ...pages.first];
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
    state.value = prev.filterItems((r) => r.id != reviewId);
  }
}

@Riverpod(keepAlive: true)
class ProjectReviewListQuery extends _$ProjectReviewListQuery {
  @override
  ProjectReviewQueryState build() => ProjectReviewQueryState(
        rating: null,
        cardinal: null,
      );

  void setRatingQuery(double? rating) {
    state = state.copyWith(rating: rating);
  }

  void setCardinalQuery(String? cardinal) {
    state = state.copyWith(cardinal: cardinal);
  }

  void clearQuery() {
    state = ProjectReviewQueryState(
      rating: null,
      cardinal: null,
    );
  }
}
