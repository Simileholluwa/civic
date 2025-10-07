import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class ValidateCreateAccountUseCase
    implements UseCase<UserInfo, ValidateCreateAccountParams> {
  ValidateCreateAccountUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserInfo>> call(
      ValidateCreateAccountParams params,) async {
    final result = await _authRepository.validateCreateAccount(
      email: params.email,
      code: params.code,
      password: params.password,
      userRecord: params.userRecord,
    );
    return result;
  }
}

class ValidateCreateAccountParams {
  ValidateCreateAccountParams({
    required this.code,
    required this.email,
    required this.password,
    required this.userRecord,
  });
  final String code;
  final String email;
  final String password;
  final UserRecord userRecord;
}
