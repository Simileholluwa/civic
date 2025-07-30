import 'package:civic_flutter/core/core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ContentScrollWrapper extends ConsumerWidget {
  const ContentScrollWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification &&
            notification.direction == ScrollDirection.forward) {
          ref.watch(showBottomNav.notifier).setValue(false);
        } else if (notification is UserScrollNotification &&
            notification.direction == ScrollDirection.reverse) {
          ref.watch(showBottomNav.notifier).setValue(true);
        }
        return true;
      },
      child: child,
    );
  }
}
