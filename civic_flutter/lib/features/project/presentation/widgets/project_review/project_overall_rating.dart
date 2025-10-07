import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectOverallRating extends StatelessWidget {
  const ProjectOverallRating({
    required this.title, required this.rating, super.key,
  });

  final double rating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              rating.toString(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 50,
                  ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                RatingBar(
                  rating: rating,
                  ratingCount: null,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
