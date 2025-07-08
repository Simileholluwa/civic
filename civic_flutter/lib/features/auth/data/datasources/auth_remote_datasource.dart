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

  Future<UserRecord?> signInWithEmailAndPassword({
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
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
          message: 'Incorrect verification code.',
        );
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserRecord?> signInWithEmailAndPassword({
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
              message: 'Your password is incorrect.',
            );
          case 1:
            throw const ServerException(
              message: 'Unable to create user',
            );
          case 2:
            throw const ServerException(
              message: 'Internal server error',
            );
          case 3:
            throw const ServerException(
              message: 'Too many failed attempts.',
            );
          case 4:
            throw const ServerException(
              message: 'Your account has been blocked',
            );
          default:
            throw const ServerException(
              message: 'Something went wrong.',
            );
        }
      }

      if (result.userInfo == null) {
        throw const ServerException(message: 'No user found.');
      }

      if (result.key == null || result.keyId == null) {
        throw const ServerException(
            message: 'Authententication keys not found');
      }

      await _sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      await _sessionManager.refreshSession();

      final userRecord = await _client.userRecord.getUser();
      if (userRecord == null) {
        throw const ServerException(
          message: 'User record not found',
        );
      }
      await _localDatabase.saveUserRecord(
        userRecord: userRecord,
      );
      return userRecord;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
          message: 'Failed to create account. Please try again.',
        );
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
      var bio = 'A Nigerian Citizen';
      final selectedPoliticalStatus = userRecord.politicalStatus!.name;
      final result = await _auth.validateAccount(
        email,
        code,
      );
      if (result == null) {
        throw const ServerException(
          message: 'Incorrect verification code',
        );
      }

      switch (selectedPoliticalStatus) {
        case 'current':
          bio = 'A current political leader';
        case 'aspiring':
          bio = 'An aspiring political leader';
        case 'former':
          bio = 'A former political leader';
        default:
          bio = bio;
      }

      final newRecord = userRecord.copyWith(
        userInfoId: result.id!,
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
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserRecord?> searchNinDetails({required String ninNumber}) async {
    try {
      final result = await _client.userRecord.getNinDetails(ninNumber);
      if (result == null) {
        return null;
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw const ServerException(
        message: 'Unable to connect to server. Please try again.',
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
          message: 'Failed to upload image',
        );
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
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
          message: 'Failed to send validation code',
        );
      }

      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
