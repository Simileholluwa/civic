import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectReviewState {
  ProjectReviewState({
    required this.reviewController, this.review = '',
     this.locationRating = 0,
    this.descriptionRating = 0,
    this.attachmentsRating = 0,
    this.categoryRating = 0,
    this.fundingRating = 0,
    this.datesRating = 0,
    this.overallRating = 0,
    this.isValid = false,
    this.isLoading = false,
    this.isEditing = false,
    this.isDeleting = false,
    this.isDeletedProject = false,
    this.isProjectOwner = false,
  });

  factory ProjectReviewState.empty() {
    return ProjectReviewState(
      reviewController: TextEditingController(),
    );
  }

  factory ProjectReviewState.populate(ProjectReview projectReview, Ref ref) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    final project = projectReview.project;
    final isDeletedProject = project?.isDeleted ?? false;
    final isProjectOwner = project?.ownerId == userId;
    return ProjectReviewState(
      review: projectReview.review ?? '',
      locationRating: projectReview.locationRating ?? 0,
      descriptionRating: projectReview.descriptionRating ?? 0,
      attachmentsRating: projectReview.attachmentsRating ?? 0,
      categoryRating: projectReview.categoryRating ?? 0,
      fundingRating: projectReview.fundingRating ?? 0,
      datesRating: projectReview.datesRating ?? 0,
      overallRating: projectReview.overallRating ?? 0,
      isEditing: !isDeletedProject && !isProjectOwner,
      isDeletedProject: isDeletedProject,
      isProjectOwner: isProjectOwner,
      reviewController:
          TextEditingController(text: projectReview.review ?? ''),
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
