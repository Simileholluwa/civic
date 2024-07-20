import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CheckIfNewUserUseCase implements UseCase<String?, CheckIfNewUserParams> {
  CheckIfNewUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, String?>> call(CheckIfNewUserParams params) async {
    final result = await _authRepository.checkIfNewUser(
      email: params.email,
    );
    return result;
  }
}

class CheckIfNewUserParams {
  CheckIfNewUserParams(
      this.email,
      );
  final String email;
}
