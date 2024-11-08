// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/providers/local_storage_provider.dart';
import 'package:civic_flutter/features/poll/data/datasources/poll_local_datasource.dart';
import 'package:civic_flutter/features/poll/data/datasources/poll_remote_datasource.dart';
import 'package:civic_flutter/features/poll/data/repositories/poll_repository_impl.dart';
import 'package:civic_flutter/features/poll/domain/usecases/cast_vote_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/delete_all_drafts_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/retrieve_drafts_poll_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/retrieve_poll_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_draft_poll_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_in_future_use_case.dart';
import 'package:civic_flutter/features/poll/domain/usecases/save_poll_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poll_service_providers.g.dart';

@riverpod
PollLocalDatabaseImpl pollLocalDatabase(PollLocalDatabaseRef ref) {
  return PollLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
PollRemoteDatasourceImpl pollRemoteDatasource(PollRemoteDatasourceRef ref) {
  return PollRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
PollRepositoryImpl pollRepositoryImpl(PollRepositoryImplRef ref) {
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
SavePollUseCase savePoll(SavePollRef ref) {
  return SavePollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
SavePollInFutureUseCase savePollInFuture(SavePollInFutureRef ref) {
  return SavePollInFutureUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
RetrievePollUseCase retrievePoll(RetrievePollRef ref) {
  return RetrievePollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
CastVoteUseCase castVote(CastVoteRef ref) {
  return CastVoteUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
SaveDraftPollUseCase saveDraftPoll(SaveDraftPollRef ref) {
  return SaveDraftPollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
RetrieveDraftPollUseCase retrieveDraftPoll(RetrieveDraftPollRef ref) {
  return RetrieveDraftPollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
DeleteAllDraftPollUseCase deleteAllDraftPoll(DeleteAllDraftPollRef ref) {
  return DeleteAllDraftPollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftPollUseCase deleteDraftPoll(DeleteDraftPollRef ref) {
  return DeleteDraftPollUseCase(
    pollRepository: ref.read(pollRepositoryImplProvider),
  );
}

