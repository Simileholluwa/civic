import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class InitiatePasswordResetUseCase implements UseCase<bool, String> {
  InitiatePasswordResetUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(String param) async {
    final result = await _authRepository.initiatePasswordReset(
      email: param,
    );
    return result;
  }
}
