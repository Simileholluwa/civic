
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UploadProfileImageUseCase
    implements UseCase<bool, UploadProfileImageParams> {
  UploadProfileImageUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(UploadProfileImageParams params) async {
    final result = await _authRepository.uploadProfileImage(
      imagePath: params.imagePath,
    );
    return result;
  }
}

class UploadProfileImageParams {
  UploadProfileImageParams(
    this.imagePath,
  );
  final String imagePath;
}
