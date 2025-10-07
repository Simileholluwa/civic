import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CheckIfNewUserUseCase implements UseCase<String?, String> {
  CheckIfNewUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, String?>> call(String param) async {
    final result = await _authRepository.checkIfNewUser(
      email: param,
    );
    return result;
  }
}
