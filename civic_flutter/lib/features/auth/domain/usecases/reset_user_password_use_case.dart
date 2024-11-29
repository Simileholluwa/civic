import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class ResetUserPasswordUseCase
    implements UseCase<bool, ResetUserPasswordParams> {
  ResetUserPasswordUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(ResetUserPasswordParams params) async {
    final result = await _authRepository.resetUserPassword(
      email: params.email,
      newPassword: params.password,
      verificationCode: params.verificationCode
    );
    return result;
  }
}

class ResetUserPasswordParams {
  ResetUserPasswordParams(
    this.email,
    this.password,
    this.verificationCode,
  );
  final String password;
  final String email;
  final String verificationCode;
}
