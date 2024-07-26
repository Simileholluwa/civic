import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:civic_flutter/features/profile/data/repository/profile_repository_impl.dart';
import 'package:civic_flutter/features/profile/domain/repository/profile_repository.dart';
import 'package:civic_flutter/features/profile/domain/usecases/me_use_case.dart';
import 'package:civic_flutter/features/profile/presentation/controller/profile_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRemoteDatasourceProvider =
    Provider<ProfileRemoteDatasource>((ref) {
  return ProfileRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(
    remoteDatasource: ref.read(
      profileRemoteDatasourceProvider,
    ),
  );
});

final meUseCaseProvider = Provider<MeUseCase>((ref) {
  return MeUseCase(
    profileRepository: ref.read(
      profileRepositoryProvider,
    ),
  );
});

final profileProvider = Provider<ProfileController>((ref) {
  return ProfileController(
    meUseCase: ref.read(
      meUseCaseProvider,
    ),
  );
});
