//ignore_for_file:avoid_public_notifier_properties
import 'dart:async';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedPollList extends _$PaginatedPollList {
  final PagingController<int, Poll> pagingController =
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
    final listPollUseCase = ref.read(getPollsProvider);
    final result = await listPollUseCase(
      GetPollsParams(
        page,
        limit,
      ),
    );
    result.fold((error) {
      log(error.toString(), name: 'PaginatedPollList');
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
    });} catch (e) {
      log(e.toString(), name: 'PaginatedPostList');
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

  void addPoll(Poll poll) {
    if (pagingController.itemList != null) {
      final updatedList = List<Poll>.from(pagingController.itemList ?? []);
      updatedList.insert(0, poll);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }

  void removePollById(int? pollId) {
    if (pagingController.itemList != null && pollId != null) {
      final updatedList = List<Poll>.from(pagingController.itemList ?? []);
      updatedList.removeWhere((element) => element.id == pollId);
      pagingController.value = PagingState(
        nextPageKey: pagingController.nextPageKey,
        itemList: updatedList,
      );
    }
  }
}