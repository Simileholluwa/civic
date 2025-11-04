import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_bookmarks_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectBookmarksList extends _$PaginatedProjectBookmarksList {
  final PagingController<int, Project> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
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
    return pagingController.value.status;
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    try {
      final projectBookmarksUseCase = ref.read(getPaginatedBookmarksProvider);
      final result = await projectBookmarksUseCase(
        GetUserProjectBookmarksParams(
          page,
          limit,
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

  void addProject(Project? project) {
    if (pagingController.itemList != null && project != null) {
      final currentList = pagingController.itemList ?? [];
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: [project, ...currentList],
      );
    }
  }

  void removeAllProjects() {
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: const [],
    );
  }

  void removeProject(Project project) {
    final updatedList = List<Project>.from(pagingController.itemList ?? [])
      ..remove(project);
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: updatedList,
    );
  }

  void removeProjectById(int projectId) {
    if (pagingController.itemList == null) {
      return;
    }
    final updatedList = List<Project>.from(pagingController.itemList ?? [])
      ..removeWhere((element) => element.id == projectId);
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: updatedList,
    );
  }

  Future<void> clearBookmarksList() async {
    removeAllProjects();
    final clearBookmarks = ref.read(clearProjectBookmarksProvider);
    final result = await clearBookmarks(NoParams());
    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return;
    }, (_) async {
      return;
    });
  }
}
