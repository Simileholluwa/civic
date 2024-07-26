// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/civic/domain/entity/custom_bottom_navigation_bar.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:civic_flutter/features/civic/presentation/widgets/show_options.dart';

class CivicWrapper extends StatefulWidget {
  const CivicWrapper({
    super.key,
    required this.navigatorShell,
  });
  final StatefulNavigationShell navigatorShell;

  @override
  State<CivicWrapper> createState() => _CivicWrapperState();
}

class _CivicWrapperState extends State<CivicWrapper> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        floatingActionButton: PortalTarget(
          visible: _isExpanded,
          anchor: const Aligned(
            follower: Alignment(-0.55, 1),
            target: Alignment.topLeft,
          ),
          portalFollower: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isExpanded = false;
              });
            },
            child: ShowOptions(
              isExpanded: _isExpanded,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: TColors.primary,
              ),
              child: Icon(
                _isExpanded == true ? Icons.clear : Icons.apps,
                size: 30,
                color: TColors.textWhite,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: widget.navigatorShell.currentIndex,
          onItemTapped: (index) {
            widget.navigatorShell.goBranch(
              index,
              initialLocation: index == widget.navigatorShell.currentIndex,
            );
          },
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.home5,
              inactiveIcon: Iconsax.home,
            ),
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.activity5,
              inactiveIcon: Iconsax.activity,
            ),
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.search_normal4,
              inactiveIcon: Iconsax.search_normal,
              iconSize: 32,
            ),
            CustomBottomNavigationBarItem(
              activeIcon: Iconsax.notification5,
              inactiveIcon: Iconsax.notification,
            ),
            CustomBottomNavigationBarItem(
              activeIcon: CupertinoIcons.person_alt_circle_fill,
              inactiveIcon: CupertinoIcons.person_alt_circle,
              iconSize: 32,
            ),
          ],
        ),
        body: widget.navigatorShell,
      ),
    );
  }
}
