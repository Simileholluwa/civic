import 'package:flutter/material.dart';

class ContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double height;
  final bool isVisible;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final double? bottomHeight;
  const ContentAppBar({
    super.key,
    required this.title,
    this.height = 65,
    required this.isVisible,
    this.actions = const [],
    this.bottom,
    this.bottomHeight,
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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: AppBar(
        title: title,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null ? height : height + bottomHeight!,
      );
}
