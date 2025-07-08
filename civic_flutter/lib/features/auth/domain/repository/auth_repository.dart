import 'package:fpdart/fpdart.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> createAccountRequest({
    required String email,
    required String password,
    required String firstName,
  });

  Future<Either<Failure, UserInfo>> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required UserRecord userRecord,
  });

  Future<Either<Failure, UserRecord?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<Either<Failure, bool>> initiatePasswordReset({
    required String email,
  });

  Future<Either<Failure, String?>> checkIfNewUser({
    required String email,
  });

  Future<Either<Failure, bool>> uploadProfileImage({
    required String imagePath,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> saveUserRecord({
    required UserRecord userRecord,
  });

  Either<Failure, UserRecord> getUserRecord();

  Future<Either<Failure, void>> removeUserRecord();

  Future<Either<Failure, UserRecord?>> searchNinDetails({
    required String ninNumber,
  });
}
