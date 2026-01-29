import 'package:civic_client/civic_client.dart';

class ProjectCardState {
  ProjectCardState({
    this.impressionCount = 0,
    this.numberOfLikes = 0,
    this.numberOfReviews = 0,
    this.numberOfReposts = 0,
    this.numberOfVettings = 0,
    this.numberOfBookmarks = 0,
    this.hasReviewed = false,
    this.hasVetted = false,
    this.locations = const [],
    this.isFollower = false,
    this.hasLiked = false,
    this.isBookmarked = false,
    this.isSubscribed = false,
    this.isDeleted = false,
    this.canDelete = false,
    this.hasReposted = false,
  });

  factory ProjectCardState.empty() {
    return ProjectCardState();
  }

  factory ProjectCardState.populate(
    ProjectWithUserState projectWithUserState,
  ) {
    final project = projectWithUserState.project;
    return ProjectCardState(
      impressionCount: 100,
      numberOfLikes: project.likesCount ?? 0,
      isSubscribed: projectWithUserState.isSubscribed!,
      numberOfReviews: project.reviewsCount ?? 0,
      numberOfVettings: project.vettingsCount ?? 0,
      numberOfBookmarks: project.bookmarksCount ?? 0,

      hasLiked: projectWithUserState.hasLiked ?? false,
      hasReviewed: projectWithUserState.hasReviewed ?? false,
      hasVetted: projectWithUserState.hasVetted ?? false,
      isBookmarked: projectWithUserState.hasBookmarked ?? false,
      numberOfReposts: project.quotesCount ?? 0,
      hasReposted: projectWithUserState.hasReposted ?? false,
      locations: project.physicalLocations ?? [],
      isFollower: projectWithUserState.isFollower ?? false,
      isDeleted: project.isDeleted ?? false,
    );
  }

  final bool canDelete;
  final bool hasLiked;
  final bool hasReviewed;
  final bool hasVetted;
  final bool isBookmarked;
  final bool isDeleted;
  final bool isFollower;
  final bool isSubscribed;
  final bool hasReposted;
  final List<AWSPlaces>? locations;
  final int numberOfBookmarks;
  final int numberOfLikes;
  final int numberOfReposts;
  final int numberOfReviews;
  final int numberOfVettings;
  final int impressionCount;

  ProjectCardState copyWith({
    bool? canDelete,
    bool? hasLiked,
    bool? hasReviewed,
    bool? hasVetted,
    bool? isBookmarked,
    bool? isDeleted,
    bool? isFollower,
    bool? isSubscribed,
    bool? hasReposted,
    List<AWSPlaces>? locations,
    int? numberOfBookmarks,
    int? numberOfLikes,
    int? numberOfReposts,
    int? numberOfReviews,
    int? numberOfVettings,
    int? impressionCount,
  }) {
    return ProjectCardState(
      canDelete: canDelete ?? this.canDelete,
      hasLiked: hasLiked ?? this.hasLiked,
      hasReviewed: hasReviewed ?? this.hasReviewed,
      hasVetted: hasVetted ?? this.hasVetted,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isDeleted: isDeleted ?? this.isDeleted,
      isFollower: isFollower ?? this.isFollower,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      hasReposted: hasReposted ?? this.hasReposted,
      locations: locations ?? this.locations,
      numberOfBookmarks: numberOfBookmarks ?? this.numberOfBookmarks,
      numberOfLikes: numberOfLikes ?? this.numberOfLikes,
      numberOfReposts: numberOfReposts ?? this.numberOfReposts,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      numberOfVettings: numberOfVettings ?? this.numberOfVettings,
      impressionCount: impressionCount ?? this.impressionCount,
    );
  }
}

extension ProjectCardStateCounts on ProjectCardState {
  ProjectCardState applyCounts(ProjectCounts counts) => copyWith(
    numberOfLikes: counts.likesCount,
    numberOfReviews: counts.reviewsCount,
    numberOfVettings: counts.vettingsCount,
    numberOfBookmarks: counts.bookmarksCount,
    numberOfReposts: counts.quotesCount,
    impressionCount: counts.impressionsCount,
  );
}
