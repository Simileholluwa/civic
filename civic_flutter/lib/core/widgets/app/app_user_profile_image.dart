import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUserProfileImage extends StatelessWidget {
  const AppUserProfileImage({
    required this.imageUrl,
    super.key,
    this.radius = 25,
    this.iconSize = 47,
  });

  final String imageUrl;
  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: TColors.primary,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: radius * 2,
          width: radius * 2,
          errorWidget: (context, url, child) {
            return Center(
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: iconSize,
                color: TColors.textWhite,
              ),
            );
          },
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: iconSize,
                color: TColors.textWhite,
              ),
            );
          },
        ),
      ),
    );
  }
}
