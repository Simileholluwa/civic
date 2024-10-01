import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: TColors.primary,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: 50,
          width: 50,
          errorWidget: (context, url, child) {
            return const Center(
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 47,
                color: TColors.textWhite,
              ),
            );
          },
          progressIndicatorBuilder: (context, url, progress) {
            return const Center(
              child: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 47,
                color: TColors.textWhite,
              ),
            );
          },
        ),
      ),
    );
  }
}
