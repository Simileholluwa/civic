import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateAccountRequestUseCase implements UseCase<bool, CreateAccountRequestParams> {
  CreateAccountRequestUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(CreateAccountRequestParams params) async {
    final result = await _authRepository.createAccountRequest(
      email: params.email,
      password: params.password,
      userName: params.userName,
    );
    return result;
  }
}

class CreateAccountRequestParams {
  CreateAccountRequestParams(
    this.password,
    this.email,
    this.userName,
  );
  final String password;
  final String email;
  final String userName;
}
