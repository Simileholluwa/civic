class ProjectReviewQueryState {

  ProjectReviewQueryState({
    required this.rating,
    required this.cardinal,
  });
  final double? rating;
  final String? cardinal;

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
