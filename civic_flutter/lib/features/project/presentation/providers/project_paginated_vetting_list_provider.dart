import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_vetting_list_provider.g.dart';

Timer? _debounceTimer;

@Riverpod(keepAlive: true)
class PaginatedProjectVettingList extends _$PaginatedProjectVettingList {
  @override
  Raw<PagingController<int, ProjectVettingWithUserState>> build() {
    final controller = PagingController<int, ProjectVettingWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
    ref.onDispose(controller.dispose);
    return controller;
  }

  Future<List<ProjectVettingWithUserState>> _fetchPage(int pageKey, {int limit = 50}) async {
    const debounceDuration = Duration(milliseconds: 300);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    final completer = Completer<List<ProjectVettingWithUserState>>();
    _debounceTimer = Timer(debounceDuration, () async {
      final usecase = ref.read(getVettedProjectsProvider);

      try {
        final result = await usecase(
          GetVettedProjectsParams(
            pageKey,
            limit,
          ),
        );
        result.fold(
          completer.completeError,
          (data) => completer.complete(data.results),
        );
      } on Exception catch (e) {
        completer.completeError(e.toString());
      }
    });

    return completer.future;
  }

  void addVetting(ProjectVettingWithUserState vettingWithUserState) {
    final current = state.value;
    final pages = current.pages;
    if (pages == null || pages.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [vettingWithUserState],
        ],
        keys: const [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }

    if (pages.first.any((v) => v.vetting.id == vettingWithUserState.vetting.id)){
      state.value = current.mapItems(
        (v) => v.vetting.id == vettingWithUserState.vetting.id
            ? vettingWithUserState
            : v,
      );
      return;
    }
    final updatedFirst = [vettingWithUserState, ...pages.first];
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

  void deleteVetting(int vettingId) {
    final prev = state.value;
    state.value = prev.filterItems((v) => v.vetting.id != vettingId);
  }
}
