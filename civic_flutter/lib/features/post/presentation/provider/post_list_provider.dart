import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/post/domain/usecases/list_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PostList extends _$PostList {
  static final PagingController<int, Post> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build() {
    pagingController.addPageRequestListener((page) {
      fetchPage(page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });
    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage(int page, {int limit = 10}) async {
    final listPostUseCase = ref.read(listPostProvider);
    final result = await listPostUseCase(
      ListPostParams(
        page,
        limit,
      ),
    );
    result.fold((error) => log(error.message), (data) {
      if (data.canLoadMore) {
        pagingController.appendPage(
          data.results,
          data.page + 1,
        );
      } else {
        pagingController.appendLastPage(data.results);
      }
    });
  }

  void refresh() {
    pagingController.refresh();
  }
}
