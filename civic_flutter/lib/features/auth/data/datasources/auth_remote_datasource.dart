import 'dart:async';

import 'dart:io';
import 'dart:typed_data';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class AuthRemoteDatabase {
  Future<bool> createAccountRequest({
    required String email,
    required String password,
    required String firstName,
  });

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<UserInfo> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required UserRecord userRecord,
  });

  Future<bool> initiatePasswordReset({
    required String email,
  });

  Future<String?> checkIfNewUser({
    required String email,
  });

  Future<void> logout();

  Future<bool> uploadProfileImage({
    required String imagePath,
  });

  Future<UserRecord?> searchNinDetails({
    required String ninNumber,
  });
}

class AuthRemoteDatabaseImpl implements AuthRemoteDatabase {
  AuthRemoteDatabaseImpl({
    required Client client,
    required SessionManager sessionManager,
    required EmailAuthController auth,
    required AuthLocalDatasource localDatabase,
  })  : _client = client,
        _auth = auth,
        _sessionManager = sessionManager,
        _localDatabase = localDatabase;

  final Client _client;
  final SessionManager _sessionManager;
  final EmailAuthController _auth;
  final AuthLocalDatasource _localDatabase;

  @override
  Future<String?> checkIfNewUser({required String email}) async {
    try {
      final result = await _client.userRecord.checkIfNewUser(
        email,
      );

      if (result == null) {
        return null;
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final result = await _auth.resetPassword(
        email,
        verificationCode,
        newPassword,
      );
      if (!result) {
        throw const ServerException(
          message: TTexts.incorrectVerificationCode,
        );
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.modules.auth.email.authenticate(
        email,
        password,
      );
      if (!result.success && result.failReason != null) {
        final failReason = result.failReason!.index;
        switch (failReason) {
          case 0:
            throw const ServerException(
              message: TTexts.incorrectPassword,
            );
          case 1:
            throw const ServerException(
              message: TTexts.unableToCreateUser,
            );
          case 2:
            throw const ServerException(
              message: TTexts.internalServerError,
            );
          case 3:
            throw const ServerException(
              message: TTexts.tooManyFailedAttempts,
            );
          case 4:
            throw const ServerException(
              message: TTexts.accountBlocked,
            );
          default:
            throw const ServerException(
              message: TTexts.somethingWentWrong,
            );
        }
      }

      if (result.userInfo == null) {
        throw const ServerException(message: TTexts.noUserFound);
      }

      if (result.key == null || result.keyId == null) {
        throw const ServerException(
          message: TTexts.authKeysNotFound,
        );
      }

      await _sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      await _sessionManager.refreshSession();

      final userRecord = await _client.userRecord.getUser(null);
      if (userRecord == null) {
        throw const ServerException(
          message: TTexts.userRecordNotFound,
        );
      }
      await _localDatabase.saveUserRecord(
        userRecord: userRecord,
      );
      return true;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on CacheException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> createAccountRequest({
    required String email,
    required String password,
    required String firstName,
  }) async {
    try {
      final result = await _auth.createAccountRequest(
        firstName,
        email,
        password,
      );

      if (!result) {
        throw const ServerException(
          message: TTexts.failedToCreateAccount,
        );
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserInfo> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required UserRecord userRecord,
  }) async {
    try {
      var bio = TTexts.aNigerianCitizen;
      final selectedPoliticalStatus = userRecord.politicalStatus!.name;
      final result = await _auth.validateAccount(
        email,
        code,
      );
      if (result == null) {
        throw const ServerException(
          message: TTexts.incorrectVerificationCode,
        );
      }

      switch (selectedPoliticalStatus) {
        case 'current':
          bio = TTexts.aCurrentPoliticalLeader;
        case 'aspiring':
          bio = TTexts.anAspiringPoliticalLeader;
        case 'former':
          bio = TTexts.aFormerPoliticalLeader;
        default:
          bio = TTexts.aNigerianCitizen;
      }

      final newRecord = userRecord.copyWith(
        userInfoId: result.id,
        bio: bio,
        email: email,
      );

      final savedRecord = await _client.userRecord.saveUser(newRecord);
      await _localDatabase.saveUserRecord(
        userRecord: savedRecord,
      );

      await signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on CacheException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      final result = await _sessionManager.signOutDevice();
      if (!result) {
        throw const ServerException(
          message: 'Failed to sign out',
        );
      }
      await _localDatabase.removeUserRecord();
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserRecord?> searchNinDetails({
    required String ninNumber,
  }) async {
    try {
      final result = await _client.userRecord.getNinDetails(
        ninNumber,
      );
      if (result == null) {
        return null;
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> uploadProfileImage({required String imagePath}) async {
    try {
      final file = File(imagePath);
      final List<int> fileBytes = await file.readAsBytes();
      final byteData = ByteData.view(Uint8List.fromList(fileBytes).buffer);
      final result = await _sessionManager.uploadUserImage(byteData);
      if (!result) {
        throw const ServerException(
          message: TTexts.failedToUploadImage,
        );
      }
      final userRecord = await _client.userRecord.getUser(null);
      if (userRecord == null) {
        throw const ServerException(
          message: TTexts.userRecordNotFound,
        );
      }
      await _localDatabase.saveUserRecord(
        userRecord: userRecord,
      );
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: TTexts.failedToConnectToServer,
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on CacheException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> initiatePasswordReset({
    required String email,
  }) async {
    try {
      final result = await _auth.initiatePasswordReset(
        email,
      );
      if (!result) {
        throw const ServerException(
          message: TTexts.failedToSendValidationCode,
        );
      }

      return result;
    } on SocketException catch (_) {
      throw const ServerException(
        message: 'Failed to connect to server. Please try again.',
      );
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
