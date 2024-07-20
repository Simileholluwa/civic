import 'package:civic_flutter/core/device/device_utility.dart';
import 'package:civic_flutter/features/civic/presentation/pages/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CivicState {
  RxInt index = 0.obs;
  final screens = [
    const FeedScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  ScrollController scrollBottomBarController = ScrollController();
  RxBool isScrollingDown = false.obs;
  RxBool show = true.obs;
  double bottomBarHeight = TDeviceUtils.getBottomNavigationBarHeight();
  double bottomBarOffset = 0;
  RxBool showAppbar = true.obs;
  late final AnimationController animationController;

}
