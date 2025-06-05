// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'poll_service_providers.g.dart';

@riverpod
PollLocalDatabaseImpl pollLocalDatabase(Ref ref) {
  return PollLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
PollRemoteDatasourceImpl pollRemoteDatasource(Ref ref) {
  return PollRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
PollRepositoryImpl pollRepositoryImpl(Ref ref) {
  return PollRepositoryImpl(
    pollRemoteDatasource: ref.read(
      pollRemoteDatasourceProvider,
    ),
    pollLocalDatasource: ref.read(
      pollLocalDatabaseProvider,
    ),
  );
}

@riverpod
SavePollUseCase savePoll(Ref ref) {
  return SavePollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
SchedulePollUseCase schedulePoll(Ref ref) {
  return SchedulePollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
GetPollUseCase getPoll(Ref ref) {
  return GetPollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
GetPollsUseCase getPolls(Ref ref) {
  return GetPollsUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
CastVoteUseCase castVote(Ref ref) {
  return CastVoteUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
SavePollDraftUseCase savePollDraft(Ref ref) {
  return SavePollDraftUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
GetPollDraftUseCase getPollDraft(Ref ref) {
  return GetPollDraftUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
DeletePollDraftUseCase deletePollDraft(Ref ref) {
  return DeletePollDraftUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

