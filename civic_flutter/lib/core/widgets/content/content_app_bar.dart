import 'package:flutter/material.dart';

class ContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ContentAppBar({
    required this.title,
    required this.isVisible,
    super.key,
    this.height = 60,
    this.actions = const [],
    this.leading,
    this.centerTitle,
    this.titleSpacing,
    this.bottom,
  });
  final Widget title;
  final double height;
  final bool isVisible;
  final List<Widget> actions;
  final Widget? leading;
  final bool? centerTitle;
  final double? titleSpacing;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      offset: isVisible ? Offset.zero : const Offset(0, -1),
      child: isVisible
          ? AppBar(
              title: title,
              actions: actions,
              leading: leading,
              centerTitle: centerTitle,
              titleSpacing: titleSpacing,
              bottom: bottom,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null ? height : height + bottom!.preferredSize.height,
      );
}
