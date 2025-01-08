// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PollCardState {
  final UserRecord creator;
  final String timeAgo;
  final String question;
  final String numberOfViews;
  final bool hasText;
  PollCardState({
    required this.creator,
    required this.timeAgo,
    required this.question,
    required this.numberOfViews,
    required this.hasText,
  });

  factory PollCardState.populate(Poll poll) {
    return PollCardState(
      creator: poll.owner!,
      timeAgo: THelperFunctions.humanizeDateTime(poll.createdAt!),
      question: poll.question ?? '',
      numberOfViews: '100',
      hasText: poll.question?.isNotEmpty ?? false,
    );
  }
}
