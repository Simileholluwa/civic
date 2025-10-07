import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CreateAccountRequestUseCase
    implements UseCase<bool, CreateAccountRequestParams> {
  CreateAccountRequestUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(
    CreateAccountRequestParams params,
  ) async {
    final result = await _authRepository.createAccountRequest(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
    );
    return result;
  }
}

class CreateAccountRequestParams {
  CreateAccountRequestParams({
    required this.password,
    required this.email,
    required this.firstName,
  });
  final String password;
  final String email;
  final String firstName;
}
