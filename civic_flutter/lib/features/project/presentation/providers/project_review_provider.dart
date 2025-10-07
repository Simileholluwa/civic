import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_review_provider.g.dart';

@riverpod
class ProjectReviewProvider extends _$ProjectReviewProvider {
  @override
  ProjectReviewState build(ProjectReview? projectReview) {
    if (projectReview == null) {
      return ProjectReviewState.empty();
    } else if (projectReview.review?.isEmpty ?? true) {
      return ProjectReviewState.empty();
    } else {
      return ProjectReviewState.populate(
        projectReview, ref,
      );
    }
  }

  void setLocationRating(double rating) {
    state = state.copyWith(
      locationRating: rating,
    );
    isValid();
  }

  void setDescriptionRating(double rating) {
    state = state.copyWith(
      descriptionRating: rating,
    );
    isValid();
  }

  void setAttachmentsRating(double rating) {
    state = state.copyWith(
      attachmentsRating: rating,
    );
    isValid();
  }

  void setCategoryRating(double rating) {
    state = state.copyWith(
      categoryRating: rating,
    );
    isValid();
  }

  void setFundingRating(double rating) {
    state = state.copyWith(
      fundingRating: rating,
    );
    isValid();
  }

  void setDatesRating(double rating) {
    state = state.copyWith(
      datesRating: rating,
    );
    isValid();
  }

  void setReview(String review) {
    state = state.copyWith(
      review: review,
    );
    isValid();
  }

  void setOverallRating() {
    state = state.copyWith(
      overallRating: (state.locationRating +
              state.descriptionRating +
              state.attachmentsRating +
              state.categoryRating +
              state.fundingRating +
              state.datesRating) /
          6,
    );
  }

  void isValid() {
    state = state.copyWith(
      isValid: state.review.isNotEmpty &&
          state.locationRating > 0 &&
          state.descriptionRating > 0 &&
          state.attachmentsRating > 0 &&
          state.categoryRating > 0 &&
          state.fundingRating > 0 &&
          state.datesRating > 0,
    );
  }

  Future<bool> sendReview(int projectId, int? projectReviewId,
      [bool addToList = true,]) async {
    state = state.copyWith(
      isLoading: true,
    );

    setOverallRating();

    final saveReview = ref.read(saveProjectReviewProvider);
    final userId = ref.read(localStorageProvider).getInt('userId');
    final result = await saveReview(
      
      SaveProjectReviewParams(
        ProjectReview(
          id: projectReviewId,
          projectId: projectId,
          ownerId: userId!,
          review: state.review,
          locationRating: state.locationRating,
          descriptionRating: state.descriptionRating,
          attachmentsRating: state.attachmentsRating,
          categoryRating: state.categoryRating,
          fundingRating: state.fundingRating,
          datesRating: state.datesRating,
          overallRating: state.overallRating,
        ),
      ),
    );

    state = state.copyWith(
      isLoading: false,
    );
    return result.fold(
      (failure) {
        TToastMessages.errorToast(failure.message);
        return false;
      },
      (success) async {
        TToastMessages.successToast(
            'Your review has been submitted successfully',
          );
        if (addToList && projectReviewId == null) {
          ref
              .read(
                paginatedProjectReviewListProvider(projectId).notifier,
              )
              .addReview(success);
        }

        return true;
      },
    );
  }

  Future<bool> deleteReview(int projectId, int reviewId) async {
    state = state.copyWith(
      isDeleting: true,
    );
    final deleteReview = ref.read(deleteProjectReviewProvider);
    final result = await deleteReview(
      DeleteProjectReviewParams(
        reviewId,
      ),
    );
    state = state.copyWith(
      isDeleting: false,
    );
    return result.fold(
      (failure) {
        TToastMessages.errorToast(failure.message);
        return false;
      },
      (_) async {
        TToastMessages.successToast(
          'Your review was deleted successfully',
        );
        ref
            .read(
              paginatedProjectReviewListProvider(projectId).notifier,
            )
            .deleteReview(reviewId);
        return true;
      },
    );
  }

  void setEditing(bool isEditing) {
    state = state.copyWith(
      isEditing: isEditing,
    );
  }
}
