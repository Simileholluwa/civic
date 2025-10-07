import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class GetUserRecordUseCase implements NotFutureUseCase<UserRecord?, NoParams> {
  GetUserRecordUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Either<Failure, UserRecord?> call(NoParams params) {
    final result = _authRepository.getUserRecord();
    return result;
  }
}
