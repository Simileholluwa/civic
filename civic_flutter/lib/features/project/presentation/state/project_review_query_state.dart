// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectReviewQueryState {
  final double? rating;
  final String? cardinal;

  ProjectReviewQueryState({
    required this.rating,
    required this.cardinal,
  });

  ProjectReviewQueryState copyWith({
    double? rating,
    String? cardinal,
  }) {
    return ProjectReviewQueryState(
      rating: rating ?? this.rating,
      cardinal: cardinal ?? this.cardinal,
    );
  }
}
