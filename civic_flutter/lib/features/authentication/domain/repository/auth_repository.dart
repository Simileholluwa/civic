import 'package:fpdart/fpdart.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> createAccountRequest({
    required String email,
    required String password,
    required String userName,
  });

  Future<Either<Failure, UserInfo>> validateCreateAccount({
    required String email,
    required String code,
    required PoliticalStatus politicalStatus,
    required String password,
  });

  Future<Either<Failure, UserRecord?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, List<String>>> fetchAllUsernames();

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

  Future<Either<Failure, UserNinRecord?>> searchNinDetails({
    required String ninNumber,
  });

  Future<Either<Failure, UserRecord?>> currentUser();
}
