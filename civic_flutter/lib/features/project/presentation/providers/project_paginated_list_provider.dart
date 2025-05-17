//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectList extends _$PaginatedProjectList {
  final PagingController<int, Project> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
      log(state.toString(), name: 'PaginatedProjectList');
    });

    ref.onDispose(() {
      pagingController.dispose();
    });
    return pagingController.value.status;
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    try {
      final listProjectUseCase = ref.read(getProjectsProvider);
      final result = await listProjectUseCase(
        GetProjectsParams(
          page,
          limit,
        ),
      );
      result.fold((error) {
        log(error.toString(), name: 'PaginatedProjectList');
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: null,
          error: error,
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

  void addProject(Project project) {
    if (pagingController.itemList != null) {
      final currentList = pagingController.itemList ?? [];
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: [project, ...currentList],
      );
    }
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
    final updatedList = List<Project>.from(pagingController.itemList ?? []);
    updatedList.removeWhere((element) => element.id == projectId);
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: updatedList,
    );
  }
}
