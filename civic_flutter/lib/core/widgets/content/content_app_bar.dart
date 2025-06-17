import 'package:flutter/material.dart';

class ContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double height;
  final bool isVisible;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final double? bottomHeight;
  final Widget? leading;
  final bool? centerTitle;
  final bool showBorder;
  final double? titleSpacing;
  const ContentAppBar({
    super.key,
    required this.title,
    this.height = 65,
    required this.isVisible,
    this.actions = const [],
    this.bottom,
    this.bottomHeight,
    this.leading,
    this.centerTitle,
    this.titleSpacing,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: !isVisible
          ? bottom == null
              ? 0
              : bottomHeight!
          : bottom == null
              ? height
              : height + bottomHeight!,
      padding: const EdgeInsets.only(
        top: 3,
      ),
      decoration: showBorder
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            )
          : null,
      child: AppBar(
        title: title,
        actions: actions,
        bottom: bottom,
        leading: leading,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null ? height : height + bottomHeight!,
      );
}
