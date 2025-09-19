import 'package:flutter/material.dart';

class LazyLoadTab extends StatelessWidget {
  final int index;
  final TabController tabController;
  final Widget Function() builder;

  const LazyLoadTab({
    required this.index,
    required this.tabController,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        final isActive = tabController.index == index;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: isActive
              ? KeyedSubtree(
                  key: ValueKey(index),
                  child: builder(),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
