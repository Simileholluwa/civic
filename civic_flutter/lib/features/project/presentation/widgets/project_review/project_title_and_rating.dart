import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectTitleAndRating extends StatelessWidget {
  const ProjectTitleAndRating({
    required this.rating,
    required this.title,
    required this.ratingNumber,
    this.showRatingCount = true,
    this.titleSize = 33,
    this.ratingSize = 10,
    this.titleSize2 = 12,
    super.key,
  });

  final double rating;
  final String ratingNumber;
  final double ratingSize;
  final String title;
  final double titleSize;
  final double titleSize2;
  final bool showRatingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        if (showRatingCount)
        Text(
          ratingNumber,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: titleSize,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar(
                rating: rating,
                ratingCount: null,
                size: ratingSize,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: titleSize2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
