class ProjectReviewQueryState {
  ProjectReviewQueryState({
    this.rating,
    this.cardinal,
    this.sortby = 'recent',
    this.order = 'desc',
  });
  final double? rating;
  final String? cardinal;
  final String sortby;
  final String order;

  ProjectReviewQueryState copyWith({
    Object? rating = _noValue,
    Object? cardinal = _noValue,
    String? sortby,
    String? order,
  }) {
    return ProjectReviewQueryState(
      rating: rating == _noValue ? this.rating : rating as double?,
      cardinal: cardinal == _noValue ? this.cardinal : cardinal as String?,
      sortby: sortby ?? this.sortby,
      order: order ?? this.order,
    );
  }
}

const Object _noValue = Object();
