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
    this.showTopBorder = false,
    this.isScrollable = true,
    this.indicatorSize,
    this.height,
    this.activeColor,
  });

  final TabController tabController;
  final List<Widget> tabs;
  final TabAlignment? tabAlignment;
  final bool isScrollable;
  final Color? dividerColor;
  final double? dividerHeight;
  final EdgeInsetsGeometry indicatorPadding;
  final Decoration? indicator;
  final bool showTopBorder;
  final TabBarIndicatorSize? indicatorSize;
  final double? height;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: showTopBorder
            ? Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              )
            : null,
      ),
      child: TabBar(
        controller: tabController,
        tabAlignment: tabAlignment ?? TabAlignment.start,
        isScrollable: isScrollable,
        indicatorSize: indicatorSize ?? TabBarIndicatorSize.label,
        indicator: indicator,
        indicatorPadding: indicatorPadding,
        padding: EdgeInsets.only(
          left: TSizes.xs - 4,
        ),

        dividerHeight: dividerHeight,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
        dividerColor: dividerColor ?? Theme.of(context).dividerColor,
        labelColor: activeColor,
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        indicatorWeight: indicator == null ? 4 : 0,
        tabs: tabs,
      ),
    );
  }
}
