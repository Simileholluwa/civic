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
  Raw<PagingController<int, ProjectWithUserState>> build() {
    final controller = PagingController<int, ProjectWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<ProjectWithUserState>> _fetchPage(
    int pageKey, {
    int limit = 50,
  }) async {
    final usecase = ref.read(getPaginatedBookmarksProvider);

    final result = await usecase(
      GetUserProjectBookmarksParams(pageKey, limit),
    );
    return result.fold(
      (error) => throw error,
      (data) => data.results,
    );
  }

  void addProject(ProjectWithUserState? project) {
    if (project == null) return;
    final current = state.value;
    final pages = current.pages;

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
    // If project already exists in the first page, update it.
    if (pages.first.any((p) => p.project.id == project.project.id)) {
      state.value = state.value.mapItems((p) {
        if (p.project.id == project.project.id) {
          return project;
        }
        return p;
      });
      return;
    }

    final updatedFirst = [project, ...pages.first];
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
    state.value = current.copyWith(
      pages: const [<ProjectWithUserState>[]],
      keys: const [1],
      hasNextPage: current.hasNextPage,
    );
  }

  void removeProjectById(int projectId) {
    final prev = state.value;
    state.value = prev.filterItems((n) {
      return n.project.id != projectId;
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
