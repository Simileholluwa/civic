//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_paginated_vetting_list_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class PaginatedProjectVettingList extends _$PaginatedProjectVettingList {
  final PagingController<int, ProjectVetting> pagingController =
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
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int page, {int limit = 50}) async {
    const debounceDuration = Duration(milliseconds: 1000);
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () async {
      try {
        final listVettedProjectUseCase = ref.read(getVettedProjectsProvider);
        final result = await listVettedProjectUseCase(
          GetVettedProjectsParams(
            page,
            limit,
          ),
        );
        result.fold((error) {
          log(error.message, name: 'PaginatedVettingList');
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
        log(e.toString(), name: 'PaginatedVettingList');
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: null,
          error: e.toString(),
        );
      }
    });
  }

  void refresh() {
    pagingController.refresh();
  }

  void addVetting(ProjectVetting projectVetting) {
    if (pagingController.itemList == null) return;
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: [projectVetting, ...pagingController.itemList ?? []],
    );
  }

  void deleteVetting(int vettingId) {
    final updatedList =
        List<ProjectVetting>.from(pagingController.itemList ?? []);
    updatedList.removeWhere((element) => element.id == vettingId);
    pagingController.value = PagingState(
      nextPageKey: pagingController.nextPageKey,
      itemList: updatedList,
    );
  }
}
