// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PollCardState {
  final UserRecord creator;
  final String timeAgo;
  final String question;
  final String numberOfViews;
  final bool hasText;
  final bool hasTags;
  final bool hasLocations;
  final List<UserRecord> tags;
  final List<AWSPlaces> locations;
  PollCardState({
    required this.creator,
    required this.timeAgo,
    required this.question,
    required this.numberOfViews,
    required this.hasText,
    required this.hasTags,
    required this.hasLocations,
    required this.tags,
    required this.locations,
  });

  factory PollCardState.populate(Poll poll) {
    return PollCardState(
      creator: poll.owner!,
      timeAgo: THelperFunctions.humanizeDateTime(poll.createdAt!),
      question: poll.question ?? '',
      numberOfViews: '100',
      hasText: poll.question?.isNotEmpty ?? false,
      hasTags: poll.taggedUsers?.isNotEmpty ?? false,
      hasLocations: poll.locations?.isNotEmpty ?? false,
      tags: poll.taggedUsers!,
      locations: poll.locations!,
    );
  }
}
