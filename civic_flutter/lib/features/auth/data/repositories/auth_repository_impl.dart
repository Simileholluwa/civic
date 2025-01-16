import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDatabaseImpl remoteDatabase,
    required AuthLocalDatasourceImpl localDatabase,
  })  : _remoteDatabase = remoteDatabase,
        _localDatabase = localDatabase;
  final AuthRemoteDatabaseImpl _remoteDatabase;
  final AuthLocalDatasourceImpl _localDatabase;

  @override
  Future<Either<Failure, String?>> checkIfNewUser({
    required String email,
  }) async {
    try {
      final result = await _remoteDatabase.checkIfNewUser(email: email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final result = await _remoteDatabase.resetUserPassword(
        email: email,
        verificationCode: verificationCode,
        newPassword: newPassword,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserRecord?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDatabase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> createAccountRequest({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final result = await _remoteDatabase.createAccountRequest(
        email: email,
        password: password,
        userName: userName,
      );
      return Right(result);
    } on SocketException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserInfo>> validateCreateAccount({
    required String email,
    required String code,
    required PoliticalStatus politicalStatus,
    required String password,
  }) async {
    try {
      final result = await _remoteDatabase.validateCreateAccount(
        email: email,
        code: code,
        politicalStatus: politicalStatus,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await _remoteDatabase.logout();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserNinRecord?>> searchNinDetails({
    required String ninNumber,
  }) async {
    try {
      final result = await _remoteDatabase.searchNinDetails(
        ninNumber: ninNumber,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchAllUsernames() async {
    try {
      final result = await _remoteDatabase.fetchAllUsernames();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> uploadProfileImage({
    required String imagePath,
  }) async {
    try {
      final result = await _remoteDatabase.uploadProfileImage(
        imagePath: imagePath,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> initiatePasswordReset({
    required String email,
  }) async {
    try {
      final result = await _remoteDatabase.initiatePasswordReset(
        email: email,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserRecord?>> currentUser() async {
    try {
      final result = await _remoteDatabase.currentUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Either<Failure, UserRecord> getUserRecord() {
    try {
      final result = _localDatabase.getUserRecord();
      return Right(result!);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeUserRecord() async {
    try {
      final result = await _localDatabase.removeUserRecord();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveUserRecord(
      {required UserRecord userRecord}) async {
    try {
      final result = await _localDatabase.saveUserRecord(
        userRecord: userRecord,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
