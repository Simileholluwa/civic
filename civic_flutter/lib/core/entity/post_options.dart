import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MoreOptionsModel {
  MoreOptionsModel({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
}

List<MoreOptionsModel> moreOptions = [
  MoreOptionsModel(
    icon: Icons.ballot_rounded,
    text: 'Project',
  ),
  MoreOptionsModel(
    icon: Iconsax.airdrop5,
    text: 'Post',
  ),
  MoreOptionsModel(
    icon: Iconsax.pen_add5,
    text: 'Article',
  ),
  MoreOptionsModel(
    icon: Iconsax.chart_215,
    text: 'Poll',
  ),
  MoreOptionsModel(
    icon: Iconsax.microphone5,
    text: 'Townhall',
  ),
  MoreOptionsModel(
    icon: Iconsax.video_octagon5,
    text: 'Go Live',
  ),
];
