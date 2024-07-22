import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MoreOptionsModel {
  MoreOptionsModel({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
}

List<MoreOptionsModel> moreOptions = [
    MoreOptionsModel(
      onTap: () {},
      icon: Icons.ballot_rounded,
      text: 'Project',
    ),
    MoreOptionsModel(
      onTap: () {},
      icon: Iconsax.airdrop5,
      text: 'Post',
    ),
    MoreOptionsModel(
      onTap: () {},
      icon: Iconsax.pen_add5,
      text: 'Article',
    ),
    MoreOptionsModel(
      onTap: () {},
      icon: Iconsax.chart_215,
      text: 'Poll',
    ),
    MoreOptionsModel(
      onTap: () {},
      icon: Iconsax.microphone5,
      text: 'Townhall',
    ),
    MoreOptionsModel(
      onTap: () {},
      icon: Iconsax.video_octagon5,
      text: 'Go Live',
    ),
  ];