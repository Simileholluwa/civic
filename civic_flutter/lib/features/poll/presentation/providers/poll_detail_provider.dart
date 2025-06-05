// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'poll_detail_provider.g.dart';

@riverpod
Future<Poll> pollDetail(
  Ref ref,
  int id,
) async {
  final completer = Completer<Poll>();
  if (id == 0) {
    final getPollDraft = ref.read(getPollDraftProvider);
    final result = await getPollDraft(NoParams());
    result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      (poll) {
        completer.complete(poll);
      },
    );
    return completer.future;
  } else {
    final retrievePoll = ref.read(getPollProvider);
    final result = await retrievePoll(
      GetPollParams(
        id,
      ),
    );

    result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      (poll) {
        completer.complete(poll);
      },
    );
    return completer.future;
  }
}
