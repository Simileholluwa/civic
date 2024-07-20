import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ValidateCreateAccountUseCase
    implements UseCase<UserInfo, ValidateCreateAccountParams> {
  ValidateCreateAccountUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserInfo>> call(ValidateCreateAccountParams params) async {
    final result = await _authRepository.validateCreateAccount(
      email: params.email,
      code: params.code,
    );
    return result;
  }
}

class ValidateCreateAccountParams {
  ValidateCreateAccountParams({
    required this.code,
    required this.email,
  });
  final String code;
  final String email;
}
