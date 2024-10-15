// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/usecases/retrieve_poll_use_case.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_service_providers.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_detail_provider.g.dart';

@riverpod
Future<Poll?> pollDetail(
  PollDetailRef ref,
  int id,
) async {
  if (id == 0) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      await AppLocalStorage.to.setInt(
        'userId',
        currentUser.userInfo!.id!,
      );
      return Poll(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
        question: '',
        taggedUsers: [],
        locations: [],
        mentions: [],
        tags: [],
      );
    });
  } else {
    final retrievePoll = ref.read(retrievePollProvider);
    final result = await retrievePoll(
      RetrievePollParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (poll) {
        return poll;
      },
    );
  }
}
