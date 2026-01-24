import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectList extends _$PaginatedProjectList {
  @override
  Raw<PagingController<int, Project>> build(String sortBy) {
    final controller = PagingController<int, Project>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => _fetchPage(pageKey, sortBy: sortBy),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<Project>> _fetchPage(
    int pageKey, {
    required String sortBy,
    int limit = 50,
  }) async {
    final listProjectUseCase = ref.read(getProjectsProvider);
    final completer = Completer<List<Project>>();
    try {
      final result = await listProjectUseCase(
        GetProjectsParams(
          pageKey,
          limit,
          sortBy,
        ),
      );
      result.fold(
        (error) => completer.completeError(error.message),
        (data) => completer.complete(
          data.results.map((e) => e.project).toList(),
        ),
      );
    } on Exception catch (e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }

  void refresh() {
    state.refresh();
  }

  void addProject(Project? project) {
    if (project == null) return;
    final current = state.value;
    final pages = current.pages;

    bool containsDuplicate(List<Project> list) =>
        list.any((p) => p.id == project.id);

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
    if (containsDuplicate(firstPage)) return;

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

  void updateProject(Project project) {
    final prev = state.value;
    state.value = prev.mapItems(
      (p) => p.id == project.id ? project : p,
    );
  }

  void replaceProjectById(int? tempId, Project realProject) {
    if (tempId == null) return;
    final prev = state.value;
    state.value = prev.mapItems(
      (p) => p.id == tempId ? realProject : p,
    );
  }

  void removeProjectById(int projectId) {
    final prev = state.value;
    state.value = prev.filterItems(
      (p) => p.id != projectId,
    );
  }
}
