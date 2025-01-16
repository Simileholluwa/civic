import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class SaveUserRecordUserUseCase implements UseCase<void, SaveUserRecordParams> {
  SaveUserRecordUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(SaveUserRecordParams params) async {
    final result = await _authRepository.saveUserRecord(
      userRecord: params.userRecord,
    );
    return result;
  }
}

class SaveUserRecordParams {
  SaveUserRecordParams(
      this.userRecord,
      );
  final UserRecord userRecord;
}
