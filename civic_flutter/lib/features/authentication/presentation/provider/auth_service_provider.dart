import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:civic_flutter/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/check_if_new_user_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/current_user_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/fetch_all_usernames_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/logout_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/initiate_password_reset_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/reset_user_password_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/search_user_nin_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/upload_profile_image_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/user_sign_in_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/create_account_request_usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/validate_create_account_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final remoteDatabaseProvider = Provider((ref) {
  return AuthRemoteDatabaseImpl(
    client: ref.read(clientProvider),
    sessionManager: ref.read(sessionProvider),
    auth: ref.read(authEmailProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDatabase: ref.read(
      remoteDatabaseProvider,
    ),
  );
});

final createAccountRequestProvider = Provider((ref) {
  return CreateAccountRequestUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final userSignInProvider = Provider((ref) {
  return UserSignInUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final initiatePasswordResetProvider = Provider((ref) {
  return InitiatePasswordResetUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final checkIfNewUserProvider = Provider((ref) {
  return CheckIfNewUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final logOutProvider = Provider((ref) {
  return LogoutUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final validateCreateAccountProvider = Provider((ref) {
  return ValidateCreateAccountUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final searchUserNinProvider = Provider((ref) {
  return SearchUserNinUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final fetchAllUsernamesProvider = Provider((ref) {
  return FetchAllUsernamesUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final uploadProfileImageProvider = Provider((ref) {
  return UploadProfileImageUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final resetUserPasswordProvider = Provider((ref) {
  return ResetUserPasswordUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});

final currentUserProvider = Provider((ref) {
  return CurrentUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
});
