import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_card_provider.g.dart';

@riverpod
class PollCardWidget extends _$PollCardWidget {
  @override
  PollCardState build(Poll poll) {
    return PollCardState.populate(poll);
  }
}