import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class SaveUserRecordUserUseCase implements UseCase<void, UserRecord> {
  SaveUserRecordUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(UserRecord param) async {
    final result = await _authRepository.saveUserRecord(
      userRecord: param,
    );
    return result;
  }
}
