import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/features/discover/presentation/pages/discover_screen.dart';
import 'package:civic_flutter/features/feed/presentation/pages/feed_screen.dart';
import 'package:civic_flutter/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:civic_flutter/features/profile/presentation/pages/profile_screen.dart';
import 'package:civic_flutter/features/projects/presentation/pages/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CivicState {
  RxInt index = 0.obs;

  final screens = [
    const FeedScreen(),
    const ProjectsScreen(),
    const DiscoverScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  ScrollController scrollBottomBarController = ScrollController();
  RxBool isScrollingDown = false.obs;
  RxBool show = true.obs;
  double bottomBarHeight = TDeviceUtils.getBottomNavigationBarHeight();
  double bottomBarOffset = 0;
  RxBool showAppbar = true.obs;
  RxBool isExpanded = false.obs;
  OverlayEntry? overlayEntry;
  late AnimationController animationController;
  late final AnimationController fabAnimationController;


}
