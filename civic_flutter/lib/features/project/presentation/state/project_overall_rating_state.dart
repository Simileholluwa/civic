import 'package:civic_client/civic_client.dart';

class ProjectOverallRatingState {

  ProjectOverallRatingState({
     this.overallRating = 0.0,
    this.overAllCategoryRating = 0.0,
    this.overAllLocationRating = 0.0,
    this.overAllDescriptionRating = 0.0,
    this.overAllAttachmentsRating = 0.0,
    this.overAllFundingRating = 0.0,
    this.overAllDatesRating = 0.0,
    this.totalRating = 0,
  });

  factory ProjectOverallRatingState.populate(Project project) {
    return ProjectOverallRatingState(
      overallRating: project.overallRating ?? 0,
      overAllCategoryRating: project.overAllCategoryRating ?? 0,
      overAllLocationRating: project.overallLocationRating ?? 0,
      overAllDescriptionRating: project.overallDescriptionRating ?? 0,
      overAllAttachmentsRating: project.overallAttachmentsRating ?? 0,
      overAllFundingRating: project.overallFundingRating ?? 0,
      overAllDatesRating: project.overallDatesRating ?? 0,
      totalRating: project.reviewsCount ?? 0,
    );
  }

  final double overallRating;
  final double overAllCategoryRating;
  final double overAllLocationRating;
  final double overAllDescriptionRating;
  final double overAllAttachmentsRating;
  final double overAllFundingRating;
  final double overAllDatesRating;
  final int totalRating;

  ProjectOverallRatingState copyWith({
    double? overallRating,
    double? overAllCategoryRating,
    double? overAllLocationRating,
    double? overAllDescriptionRating,
    double? overAllAttachmentsRating,
    double? overAllFundingRating,
    double? overAllDatesRating,
    int? totalRating,
  }) {
    return ProjectOverallRatingState(
      overallRating: overallRating ?? this.overallRating,
      overAllCategoryRating: overAllCategoryRating ?? this.overAllCategoryRating,
      overAllLocationRating: overAllLocationRating ?? this.overAllLocationRating,
      overAllDescriptionRating: overAllDescriptionRating ?? this.overAllDescriptionRating,
      overAllAttachmentsRating: overAllAttachmentsRating ?? this.overAllAttachmentsRating,
      overAllFundingRating: overAllFundingRating ?? this.overAllFundingRating,
      overAllDatesRating: overAllDatesRating ?? this.overAllDatesRating,
      totalRating: totalRating ?? this.totalRating,
    );
  }
}

extension ProjectOverallRatingStateCounts on ProjectOverallRatingState {
  ProjectOverallRatingState applyCounts(ProjectRatingCounts counts) => copyWith(
    overallRating: counts.overallRating,
    overAllCategoryRating: counts.overallCategoryRating,
    overAllLocationRating: counts.overallLocationRating,
    overAllDescriptionRating: counts.overallDescriptionRating,
    overAllAttachmentsRating: counts.overallAttachmentsRating,
    overAllFundingRating: counts.overallFundingRating,
    overAllDatesRating: counts.overallDatesRating,
    totalRating: counts.totalRating,
  );
}
