import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppInfiniteList<T> extends ConsumerWidget {
  const AppInfiniteList({
    required this.pagingController,
    required this.itemBuilder,
    required this.onRefresh,
    super.key,
    this.canCreate = true,
    this.onCreate,
    this.createText = 'Create project',
    this.noItemsFound,
    this.scrollController,
    this.scrollPhysics,
    this.shrinkWrap,
    this.showDivider = true,
    this.showRefresh = true,
    this.errorMessage,
    this.firstPageProgressIndicator,
    this.firstPageErrorIndicator,
  });

  final PagingController<int, T> pagingController;
  final Widget Function(
    BuildContext context,
    T item,
    int index,
  ) itemBuilder;
  final void Function() onRefresh;
  final bool showRefresh;
  final Widget? noItemsFound;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool? shrinkWrap;
  final bool showDivider;
  final Widget? firstPageProgressIndicator;
  final Widget? firstPageErrorIndicator;
  final String? errorMessage;
  final bool canCreate;
  final String createText;
  final VoidCallback? onCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        onRefresh,
      ),
      child: PagingListener(
        controller: pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, T>.separated(
            state: state,
            fetchNextPage: fetchNextPage,
            scrollController: scrollController,
            physics: scrollPhysics,
            separatorBuilder: (context, index) {
              final total = pagingController.items?.length ?? 0;
              if (total > 0 && index != total - 1) {
                return showDivider
                    ? const Divider(
                        height: 0,
                      )
                    : const SizedBox();
              }
              return const SizedBox();
            },
            shrinkWrap: shrinkWrap ?? false,
            builderDelegate: PagedChildBuilderDelegate<T>(
              animateTransitions: true,
              itemBuilder: itemBuilder,
              firstPageProgressIndicatorBuilder: (context) {
                return firstPageProgressIndicator ??
                    const Center(
                      child: AppLoadingWidget(),
                    );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return firstPageErrorIndicator ??
                    LoadingError(
                      retry: () => Future.sync(
                        onRefresh,
                      ),
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        60,
                      ),
                      errorMessage: errorMessage,
                      mainAxisAlignment: MainAxisAlignment.center,
                      showRefresh: showRefresh,
                    );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(
                    15,
                    0,
                    15,
                    60
                  ),
                  child: noItemsFound ??
                      AppEmptyList(
                        canCreate: canCreate,
                        onCreate: onCreate,
                        createText: createText,
                      ),
                );
              },
              noMoreItemsIndicatorBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 30,
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Icon(
                            Iconsax.star,
                            size: 12,
                            color: Theme.of(context).hintColor,
                          ),
                          Icon(
                            Iconsax.star,
                            size: 12,
                            color: Theme.of(context).hintColor,
                          ),
                          Icon(
                            Iconsax.star,
                            size: 12,
                            color: Theme.of(context).hintColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AppEmptyList extends StatelessWidget {
  const AppEmptyList({
    required this.canCreate,
    required this.createText,
    this.onCreate,
    this.emptyText = 'Nothing Here.',
    this.emptySubText = "We've searched far and wide, but we couldn't find any results.",
    super.key,
  });

  final bool canCreate;
  final VoidCallback? onCreate;
  final String createText;
  final String emptyText;
  final String emptySubText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          emptyText,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 30,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          emptySubText,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).hintColor,
              ),
          textAlign: TextAlign.center,
        ),
        if (canCreate)
          const SizedBox(
            height: 1,
          ),
        if (canCreate)
          SizedBox(
            height: 55,
            width: double.maxFinite,
            child: ContentSingleButton(
              onPressed: onCreate,
              text: createText,
              buttonIcon: Iconsax.magicpen5,
            ),
          ),
      ],
    );
  }
}
