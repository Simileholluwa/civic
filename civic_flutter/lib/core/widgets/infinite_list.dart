import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteListWidget<T> extends StatelessWidget {
  const InfiniteListWidget({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    required this.onRefresh,
  });

  final PagingController<int, T> pagingController;
  final Widget Function(
    BuildContext context,
    T item,
    int index,
  ) itemBuilder;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      child: PagedListView(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          firstPageProgressIndicatorBuilder: (context) {
            return AppLoadingWidget(
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
            );
          },
          noItemsFoundIndicatorBuilder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.search_normal,
                    size: 100,
                  ),
                  Text(
                    "We've searched far and wide, but we couldn't find any results.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
