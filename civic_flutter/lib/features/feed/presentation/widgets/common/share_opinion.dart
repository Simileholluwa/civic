import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ShareOpinion extends StatelessWidget {
  const ShareOpinion({
    required this.imageUrl, required this.onTap, super.key,
  });

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          spacing: 15,
          children: [
            AppUserProfileImage(
              imageUrl: imageUrl,
              radius: 23,
            ),
            const Text('Share your opinion'),
          ],
        ),
      ),
    );
  }
}
