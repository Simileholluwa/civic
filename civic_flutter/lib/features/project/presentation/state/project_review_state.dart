import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewState {

  ProjectReviewState({
    required this.review,
    required this.locationRating,
    required this.descriptionRating,
    required this.attachmentsRating,
    required this.categoryRating,
    required this.fundingRating,
    required this.datesRating,
    required this.overallRating,
    required this.reviewController, this.isValid = false,
    this.isLoading = false,
    this.isEditing = false,
    this.isDeleting = false,
    this.isDeletedProject = false,
    this.isProjectOwner = false,
  });

  factory ProjectReviewState.empty() {
    return ProjectReviewState(
      review: '',
      locationRating: 0,
      descriptionRating: 0,
      attachmentsRating: 0,
      categoryRating: 0,
      fundingRating: 0,
      datesRating: 0,
      overallRating: 0,
      reviewController: TextEditingController(),
    );
  }

  factory ProjectReviewState.populate(ProjectReview projectReview, Ref ref) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return ProjectReviewState(
      review: projectReview.review!,
      locationRating: projectReview.locationRating!,
      descriptionRating: projectReview.descriptionRating!,
      attachmentsRating: projectReview.attachmentsRating!,
      categoryRating: projectReview.categoryRating!,
      fundingRating: projectReview.fundingRating!,
      datesRating: projectReview.datesRating!,
      overallRating: projectReview.overallRating!,
      isEditing: !projectReview.project!.isDeleted! &&
          !(projectReview.project!.ownerId == userId),
      isDeletedProject: projectReview.project!.isDeleted!,
      isProjectOwner: projectReview.project!.ownerId == userId,
      reviewController: TextEditingController(text: projectReview.review),
    );
  }
  final String review;
  final double locationRating;
  final double descriptionRating;
  final double attachmentsRating;
  final double categoryRating;
  final double fundingRating;
  final double datesRating;
  final double overallRating;
  final bool isValid;
  final bool isLoading;
  final bool isDeleting;
  final bool isEditing;
  final bool isDeletedProject;
  final bool isProjectOwner;
  final TextEditingController reviewController;

  ProjectReviewState copyWith({
    String? review,
    double? locationRating,
    double? descriptionRating,
    double? attachmentsRating,
    double? categoryRating,
    double? fundingRating,
    double? datesRating,
    double? overallRating,
    bool? isValid,
    bool? isLoading,
    bool? isEditing,
    bool? isDeleting,
    TextEditingController? reviewController,
  }) {
    return ProjectReviewState(
      review: review ?? this.review,
      locationRating: locationRating ?? this.locationRating,
      descriptionRating: descriptionRating ?? this.descriptionRating,
      attachmentsRating: attachmentsRating ?? this.attachmentsRating,
      categoryRating: categoryRating ?? this.categoryRating,
      fundingRating: fundingRating ?? this.fundingRating,
      datesRating: datesRating ?? this.datesRating,
      overallRating: overallRating ?? this.overallRating,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
      isEditing: isEditing ?? this.isEditing,
      isDeleting: isDeleting ?? this.isDeleting,
      reviewController: reviewController ?? this.reviewController,
    );
  }
}
