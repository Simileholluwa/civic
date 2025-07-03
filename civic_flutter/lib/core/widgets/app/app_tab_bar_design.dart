import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppTabBarDesign extends StatelessWidget {
  const AppTabBarDesign({
    super.key,
    required this.tabController,
    required this.tabs,
    this.tabAlignment,
    this.dividerColor,
    this.dividerHeight,
    this.indicator,
    this.indicatorPadding = EdgeInsets.zero,
  });

  final TabController tabController;
  final List<Widget> tabs;
  final TabAlignment? tabAlignment;
  final Color? dividerColor;
  final double? dividerHeight;
  final EdgeInsetsGeometry indicatorPadding;
  final Decoration? indicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabAlignment: tabAlignment ?? TabAlignment.start,
      isScrollable: true,
      indicator: indicator,
      indicatorPadding: indicatorPadding,
      padding: const EdgeInsets.only(
        left: TSizes.xs - 4,
        right: TSizes.xs,
      ),
      dividerHeight: dividerHeight,
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 14,
            color: Theme.of(context).dividerColor,
          ),
      dividerColor: dividerColor ?? Theme.of(context).dividerColor,
      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
      indicatorWeight: 4,
      tabs: tabs,
      
    );
  }
}
