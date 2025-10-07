import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';

class ProjectRatingSummary extends StatelessWidget {
  const ProjectRatingSummary({
    required this.project, super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              ProjectTitleAndRating(
                ratingNumber:
                    project.overallLocationRating.toString().substring(0, 3),
                rating: project.overallLocationRating!,
                title: 'Location',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
              const SizedBox(
                height: 65,
                child: VerticalDivider(),
              ),
              ProjectTitleAndRating(
                ratingNumber: project.overallDescriptionRating
                    .toString()
                    .substring(0, 3),
                rating: project.overallDescriptionRating!,
                title: 'Description',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
              const SizedBox(
                height: 65,
                child: VerticalDivider(),
              ),
              ProjectTitleAndRating(
                ratingNumber: project.overallAttachmentsRating
                    .toString()
                    .substring(0, 3),
                rating: project.overallAttachmentsRating!,
                title: 'Attachments',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
              const SizedBox(
                height: 65,
                child: VerticalDivider(),
              ),
              ProjectTitleAndRating(
                ratingNumber:
                    project.overAllCategoryRating.toString().substring(0, 3),
                rating: project.overAllCategoryRating!,
                title: 'Category',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
              const SizedBox(
                height: 65,
                child: VerticalDivider(),
              ),
              ProjectTitleAndRating(
                ratingNumber:
                    project.overallFundingRating.toString().substring(0, 3),
                rating: project.overallFundingRating!,
                title: 'Funding',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
              const SizedBox(
                height: 65,
                child: VerticalDivider(),
              ),
              ProjectTitleAndRating(
                ratingNumber:
                    project.overallDatesRating.toString().substring(0, 3),
                rating: project.overallDatesRating!,
                title: 'Dates',
                titleSize: 50,
                ratingSize: 18,
                titleSize2: 15,
              ),
            ],
          ),
        ),
        const Divider(
          height: 3,
        ),
      ],
    );
  }
}
