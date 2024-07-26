import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class MeUseCase implements UseCase<UserRecord, NoParams> {
  MeUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, UserRecord>> call(NoParams params) async {
    final result = await _profileRepository.me();
    return result;
  }
}

