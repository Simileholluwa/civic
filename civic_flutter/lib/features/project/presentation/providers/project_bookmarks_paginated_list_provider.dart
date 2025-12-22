import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_bookmarks_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedProjectBookmarksList extends _$PaginatedProjectBookmarksList {
  @override
  Raw<PagingController<int, Project>> build() {
    final controller = PagingController<int, Project>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<Project>> _fetchPage(int pageKey, {int limit = 50}) async {
    final usecase = ref.read(getPaginatedBookmarksProvider);
    final completer = Completer<List<Project>>();

    final result = await usecase(
      GetUserProjectBookmarksParams(pageKey, limit),
    );
    result.fold(
      (error) => completer.completeError(error.message),
      (data) => completer.complete(
        data.results.map((e) => e.project).toList(),
      ),
    );

    return completer.future;
  }

  void addProject(Project? project) {
    if (project == null) return;
    // Treat controller.value as a paging state that may have pages/keys (v5 style).
    final current = state.value;
    final pages = current.pages;

    // Helper to detect duplicate by id across first page.
    bool containsDuplicate(List<Project> list) =>
        list.any((p) => p.id == project.id);

    // If no pages yet, initialize with a single page containing the project.
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

  void removeAllProjects() {
    final current = state.value;
    final pages = current.pages;

    // Already empty (no pages or first page empty) – nothing to do.
    if (pages == null || pages.isEmpty || (pages.first.isEmpty)) {
      // Ensure at least a single empty page structure for consistent UI if completely unset.
      if (pages == null || pages.isEmpty) {
        state.value = current.copyWith(
          pages: const [<Project>[]],
          keys: const [1],
          hasNextPage: current.hasNextPage,
        );
      }
      return;
    }

    // Replace first page contents with empty list; keep remaining pages structure.
    final updatedPages = <List<Project>>[
      <Project>[],
      ...pages.skip(1),
    ];

    // Align keys length with pages length.
    final updatedKeys = [...?current.keys];
    while (updatedKeys.length < updatedPages.length) {
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
    state.value = prev.filterItems((n) {
      return n.id != projectId;
    });
  }

  Future<void> clearBookmarksList() async {
    removeAllProjects();
    final clearBookmarks = ref.read(clearProjectBookmarksProvider);
    final result = await clearBookmarks(NoParams());
    result.fold(
      (error) => TToastMessages.errorToast(error.message),
      (_) {},
    );
  }
}
