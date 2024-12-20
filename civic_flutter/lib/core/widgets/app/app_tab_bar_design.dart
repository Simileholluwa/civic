import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppTabBarDesign extends StatelessWidget {
  const AppTabBarDesign({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TabBar(
      controller: tabController,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelColor: isDark ? TColors.textWhite : TColors.dark,
      unselectedLabelColor: isDark ? TColors.darkerGrey : TColors.darkGrey,
      padding: const EdgeInsets.only(
        left: TSizes.xs - 1,
        right: TSizes.xs,
      ),
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
      indicatorColor: isDark ? TColors.textWhite : TColors.dark,
      indicatorWeight: 4,
      tabs: tabs,
    );
  }
}
