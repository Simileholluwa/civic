import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  ConsumerState<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  bool _isOpen = false;
  void togglePopup() {
    setState(() => _isOpen = !_isOpen);
  }

  @override
  Widget build(BuildContext context) {
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(savedRecordString.toString());
    final userRecord = UserRecord.fromJson(decoded);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: screenWidth > 450
            ? null
            : SizedBox(
                height: 60,
                child: BottomNavigationBar(
                  currentIndex: widget.navigatorShell.currentIndex == 0
                      ? 0
                      : widget.navigatorShell.currentIndex == 1
                          ? 2
                          : 1,
                  onTap: (index) {
                    if (index == 1) {
                      togglePopup();
                    } else if (index == 0) {
                      widget.navigatorShell.goBranch(
                        index,
                        initialLocation:
                            index == widget.navigatorShell.currentIndex,
                      );
                    } else if (index == 2) {
                      widget.navigatorShell.goBranch(
                        index - 1,
                        initialLocation:
                            (index - 1) == widget.navigatorShell.currentIndex,
                      );
                    }
                  },
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Icon(Iconsax.airdrop5),
                        icon: Icon(Iconsax.airdrop),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.add,
                        ),
                        icon: Icon(
                          Iconsax.magicpen,
                        ),
                        label: 'Create'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(Iconsax.notification5),
                        icon: Icon(Iconsax.notification),
                        label: 'Updates'),
                  ],
                ),
              ),
        body: PortalTarget(
          visible: _isOpen,
          anchor: Aligned(
            follower: Alignment.center,
            target: Alignment.center,
          ),
          portalFollower: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                painter: TrueBumpPainter(
                  color: Theme.of(context).cardColor,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 24, bottom: 56),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      Icon(
                        Iconsax.magicpen,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'What would you like to create?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          spacing: 15,
                          children: [
                            if (userRecord.politicalStatus!.index != 3)
                              CreateContentItems(
                                itemName: 'Project',
                                icon: Iconsax.note,
                                onTap: () {
                                  togglePopup();
                                  context.push(
                                    AppRoutes.createProject,
                                    extra: {
                                      'id': 0,
                                    },
                                  );
                                },
                                itemCaption:
                                    'New, existing, completed or planned. Keep your constituents updated.',
                              ),
                            CreateContentItems(
                              itemName: 'Post',
                              icon: Iconsax.calendar,
                              onTap: () {
                                togglePopup();
                                context.push(
                                  AppRoutes.createPost,
                                  extra: {
                                    'draft': null,
                                    'project': null,
                                    'id': 0,
                                  },
                                );
                              },
                              itemCaption:
                                  'Share your thoughts, ideas, and opinions with everyone.',
                            ),
                            CreateContentItems(
                              itemName: 'Poll',
                              icon: Iconsax.chart,
                              onTap: () {
                                togglePopup();
                                context.push(
                                  AppRoutes.createPoll,
                                  extra: {
                                    'id': 0,
                                    'draft': null,
                                  },
                                );
                              },
                              itemCaption:
                                  'Engage your audience with quick questions and gather instant feedback.',
                            ),
                            CreateContentItems(
                              itemName: 'Article',
                              icon: Iconsax.document,
                              onTap: () {
                                togglePopup();
                                context.push(
                                  AppRoutes.createArticle,
                                  extra: {
                                    'id': 0,
                                    'draft': null,
                                  },
                                );
                              },
                              itemCaption:
                                  'Share in-depth insights, stories, or research with your audience.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                child: InkWell(
                  onTap: () {
                    togglePopup();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).cardColor,
                        width: 5,
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  if (screenWidth > 450) AppNavigationDrawer(),
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [

                  //             SizedBox(
                  //               height: 170,

                  //               child: NavigationRail(
                  //                 useIndicator: false,
                  //                 extended: screenWidth > 600,
                  //                 backgroundColor: Theme.of(context)
                  //                     .scaffoldBackgroundColor,
                  //                 onDestinationSelected: (index) {
                  //                   if (index == 1) {
                  //                     togglePopup();
                  //                   } else if (index == 0) {
                  //                     widget.navigatorShell.goBranch(
                  //                       index,
                  //                       initialLocation: index ==
                  //                           widget
                  //                               .navigatorShell.currentIndex,
                  //                     );
                  //                   } else if (index == 2) {
                  //                     widget.navigatorShell.goBranch(
                  //                       index - 1,
                  //                       initialLocation: (index - 1) ==
                  //                           widget
                  //                               .navigatorShell.currentIndex,
                  //                     );
                  //                   }
                  //                 },
                  //                 destinations: [
                  //                   NavigationRailDestination(
                  //                     selectedIcon: Icon(
                  //                       Iconsax.airdrop5,
                  //                       size: 35,
                  //                       color: TColors.primary,
                  //                     ),
                  //                     icon: Icon(
                  //                       Iconsax.airdrop,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Home'),
                  //                   ),
                  //                   NavigationRailDestination(
                  //                     selectedIcon: Icon(
                  //                       Iconsax.magicpen5,
                  //                       size: 35,
                  //                     ),
                  //                     icon: Icon(
                  //                       Iconsax.magicpen,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Create'),
                  //                   ),
                  //                   NavigationRailDestination(
                  //                     selectedIcon: Icon(
                  //                       Iconsax.notification5,
                  //                       size: 35,
                  //                     ),
                  //                     icon: Icon(
                  //                       Iconsax.notification,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Updates'),
                  //                   ),
                  //                 ],
                  //                 selectedIndex:
                  //                     widget.navigatorShell.currentIndex == 0
                  //                         ? 0
                  //                         : widget.navigatorShell
                  //                                     .currentIndex ==
                  //                                 1
                  //                             ? 2
                  //                             : 1,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Container(
                  //               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
                  //               child: Text('Create',),
                  //               decoration: BoxDecoration(
                  //                 color: Theme.of(context).cardColor,
                  //                 borderRadius: BorderRadius.only(
                  //                   topLeft: Radius.circular(100,),
                  //                   bottomLeft: Radius.circular(100,),
                  //                 )
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 210,
                  //               child: NavigationRail(
                  //                 useIndicator: false,
                  //                 extended: screenWidth > 600,
                  //                 backgroundColor: Theme.of(context)
                  //                     .scaffoldBackgroundColor,
                  //                 onDestinationSelected: (index) {
                  //                   if (index == 1) {
                  //                     togglePopup();
                  //                   } else if (index == 0) {
                  //                     widget.navigatorShell.goBranch(
                  //                       index,
                  //                       initialLocation: index ==
                  //                           widget
                  //                               .navigatorShell.currentIndex,
                  //                     );
                  //                   } else if (index == 2) {
                  //                     widget.navigatorShell.goBranch(
                  //                       index - 1,
                  //                       initialLocation: (index - 1) ==
                  //                           widget
                  //                               .navigatorShell.currentIndex,
                  //                     );
                  //                   }
                  //                 },
                  //                 destinations: [
                  //                   NavigationRailDestination(

                  //                     icon: Icon(
                  //                       Iconsax.note,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Project'),
                  //                   ),
                  //                   NavigationRailDestination(

                  //                     icon: Icon(
                  //                       Iconsax.calendar,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Post'),
                  //                   ),
                  //                   NavigationRailDestination(

                  //                     icon: Icon(
                  //                       Iconsax.chart,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Poll'),
                  //                   ),
                  //                   NavigationRailDestination(

                  //                     icon: Icon(
                  //                       Iconsax.document,
                  //                       size: 35,
                  //                     ),
                  //                     label: Text('Article'),
                  //                   ),
                  //                 ],
                  //                 selectedIndex: null,
                  //               ),
                  //             ),
                  //             const Divider(),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //
                  //   ],
                  // ),
                  SizedBox(
                    height: screenHeight,
                    child: VerticalDivider(
                      width: 1,
                    ),
                  ),
                  Expanded(child: widget.navigatorShell),
                ],
              ),
              Visibility(
                visible: ref.watch(sendPostLoadingProvider),
                child: LinearProgressIndicator(
                  color: TColors.primary,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.dark
                      : TColors.light,
                ),
              ),
              if (_isOpen)
                GestureDetector(
                  onTap: () {
                    togglePopup();
                  },
                  child: Container(
                    color: Colors.black.withValues(alpha: .5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isCollapsed = true;
    //final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: isCollapsed == false ? 250 : 70,
      child: Drawer(
        child: ColoredBox(color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}

class CreateContentItems extends StatelessWidget {
  const CreateContentItems({
    super.key,
    required this.itemName,
    required this.icon,
    required this.onTap,
    required this.itemCaption,
  });

  final IconData icon;
  final String itemCaption;
  final String itemName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 15,
        children: [
          Icon(
            icon,
            color: TColors.primary,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Text(
                  itemCaption,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrueBumpPainter extends CustomPainter {
  TrueBumpPainter({super.repaint, required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const double cornerRadius = 20;
    const double bumpRadius = 35;

    final Paint paint = Paint()..color = color;
    final Path path = Path();

    // Start top-left
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right side down
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    // Go toward bump from right
    double bumpCenterX = size.width / 2;
    double bumpStartX = bumpCenterX + bumpRadius;
    path.lineTo(bumpStartX, size.height);

    // Draw bump (circle bulging down)
    path.arcToPoint(
      Offset(bumpCenterX - bumpRadius, size.height),
      radius: const Radius.circular(bumpRadius),
      clockwise: true,
    );

    // Complete path to bottom left
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Shadow + Fill
    canvas.drawShadow(
        path,
        Colors.black.withValues(
          alpha: 0.1,
        ),
        6.0,
        true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
