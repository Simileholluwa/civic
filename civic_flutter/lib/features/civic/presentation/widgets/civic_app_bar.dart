import 'package:flutter/material.dart';

class ScrollToHideAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScrollToHideAppBar({
    required this.controller,
    required this.visible,
    required this.title,
    this.actions,
    this.toolBarHeight = 75,
    this.centerTitle = true,
    this.leading,
    super.key,
  });

  final AnimationController controller;
  final bool visible;
  final Widget title;
  final List<Widget>? actions;
  final double toolBarHeight;
  final bool centerTitle;
  final Widget? leading;


  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position:
          Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: AppBar(
        title: title,
        toolbarHeight: visible == true ? toolBarHeight : 0,
        actions: actions,
        centerTitle: centerTitle,
        leading: leading,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        visible == true ? toolBarHeight : 0,
      );
}
