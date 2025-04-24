import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectReviewSection extends StatelessWidget {
  const ProjectReviewSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.rating,
    required this.onRatingSelected,
    required this.currentRating,
  });

  final String title;
  final String subTitle;
  final String rating;
  final ValueChanged<int> onRatingSelected;
  final int currentRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedStarRating(
              onRatingSelected: onRatingSelected,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).dividerColor,
              currentRating: currentRating,
              size: 35,
            ),
            Text(
              rating,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
