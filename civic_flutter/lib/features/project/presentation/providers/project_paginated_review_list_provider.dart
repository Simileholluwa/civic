//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_review_list_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class PaginatedProjectReviewList extends _$PaginatedProjectReviewList {
  final PagingController<int, ProjectReview> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(
    int projectId,
  ) {
    pagingController.addPageRequestListener((page) {
      fetchPage(projectId, page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int projectId, int page, {int limit = 50}) async {
    const debounceDuration = Duration(milliseconds: 1000);
    final completer = Completer<List<UserRecord>?>();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () async {
      final listReviewProjectUseCase = ref.read(getProjectReviewsProvider);
      final projectReviewStateQuery = ref.watch(projectReviewListQueryProvider);
      
      log(projectReviewStateQuery.cardinal.toString());
      final result = await listReviewProjectUseCase(
        GetProjectReviewsParams(
          projectId,
          page,
          limit,
          projectReviewStateQuery.rating,
          projectReviewStateQuery.cardinal,
        ),
      );
      result.fold((error) {
        log(error.message);
        completer.completeError(error);
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
    });
  }

  void refresh() {
    pagingController.refresh();
  }

  void addReview(ProjectReview projectReview) {
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [projectReview, ...pagingController.itemList ?? []],
    );
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
