import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectList extends _$PaginatedProjectList {
  @override
  Raw<PagingController<int, ProjectWithUserState>> build(String sortBy) {
    final controller = PagingController<int, ProjectWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(pageKey, sortBy: sortBy),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<ProjectWithUserState>> _fetchPage(
    int pageKey, {
    required String sortBy,
    int limit = 50,
  }) async {
    final listProjectUseCase = ref.read(getProjectsProvider);
    final result = await listProjectUseCase(
      GetProjectsParams(
        pageKey,
        limit,
        sortBy,
      ),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results,
    );
  }

  void refresh() {
    state.refresh();
  }

  void addProject(ProjectWithUserState? project) {
    if (project == null) return;
    final current = state.value;
    final pages = current.pages;

    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [project],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }

    final firstPage = pages.first;
    if (firstPage.any((p) => p.project.id == project.project.id)) {
      state.value = state.value.mapItems((p) {
        if (p.project.id == project.project.id) {
          return project;
        }
        return p;
      });
      return;
    }

    final updatedFirst = [project, ...firstPage];
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

  void removeProjectById(int projectId) {
    final prev = state.value;
    state.value = prev.filterItems(
      (p) => p.project.id != projectId,
    );
  }
}
