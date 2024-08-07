import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class InitiatePasswordResetUseCase
    implements UseCase<bool, InitiatePasswordResetParams> {
  InitiatePasswordResetUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(InitiatePasswordResetParams params) async {
    final result = await _authRepository.initiatePasswordReset(
      email: params.email,
    );
    return result;
  }
}

class InitiatePasswordResetParams {
  InitiatePasswordResetParams(
    this.email,
  );
  final String email;
}
