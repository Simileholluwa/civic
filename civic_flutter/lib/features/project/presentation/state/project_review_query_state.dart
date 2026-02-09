class ProjectReviewQueryState {
  ProjectReviewQueryState({
    this.rating,
    this.cardinal,
    this.sortby = 'recent',
    this.sortDir = 'desc',
  });
  final double? rating;
  final String? cardinal;
  final String sortby;
  final String sortDir;

  ProjectReviewQueryState copyWith({
    Object? rating = _noValue,
    Object? cardinal = _noValue,
    String? sortby,
    String? sortDir,
  }) {
    return ProjectReviewQueryState(
      rating: rating == _noValue ? this.rating : rating as double?,
      cardinal: cardinal == _noValue ? this.cardinal : cardinal as String?,
      sortby: sortby ?? this.sortby,
      sortDir: sortDir ?? this.sortDir,
    );
  }
}

const Object _noValue = Object();
