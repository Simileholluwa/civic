//ignore_for_file:avoid_public_notifier_properties
//ignore_for_file:avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer';
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
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    ref.onDispose(() {
      pagingController.dispose();
    });
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
        log(error.toString(), name: 'PaginatedProjectList');
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
      log(e.toString(), name: 'PaginatedProjectList');
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
      itemList: [],
    );
  }

  void removeProject(Project project) {
    final updatedList = List<Project>.from(pagingController.itemList ?? []);
    updatedList.remove(project);
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: updatedList,
    );
  }

  void removeProjectById(int projectId) {
    if (pagingController.itemList == null) {
      return;
    }
    final updatedList = List<Project>.from(pagingController.itemList ?? []);
    updatedList.removeWhere((element) => element.id == projectId);
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
