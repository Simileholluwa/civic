//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_review_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectReviewList extends _$PaginatedProjectReviewList {
  final PagingController<int, ProjectReview> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int projectId) {
    pagingController.addPageRequestListener((page) {
      fetchPage(projectId, page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int projectId, int page, {int limit = 10}) async {
    final listReviewProjectUseCase = ref.read(getProjectReviewsProvider);
    final result = await listReviewProjectUseCase(
      GetProjectReviewsParams(
        projectId,
        page,
        limit,
      ),
    );
    result.fold((error) => log(error.message), (data) {
      if (data.canLoadMore) {
        pagingController.appendPage(
          data.results,
          data.page + 1,
        );
      } else {
        pagingController.appendLastPage(data.results);
      }
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