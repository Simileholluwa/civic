import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:civic_flutter/features/authentication/data/repositories/auth_repository_impl.dart';
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

part 'auth_service_provider.g.dart';

@riverpod
AuthRemoteDatabaseImpl authRemoteDatabase(AuthRemoteDatabaseRef ref) {
  return AuthRemoteDatabaseImpl(
    client: ref.read(clientProvider),
    sessionManager: ref.read(sessionProvider),
    auth: ref.read(authEmailProvider),
  );
}

@riverpod
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    remoteDatabase: ref.read(
      authRemoteDatabaseProvider,
    ),
  );
}

@riverpod
CreateAccountRequestUseCase createAccountRequest(CreateAccountRequestRef ref) {
  return CreateAccountRequestUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UserSignInUseCase userSignIn(UserSignInRef ref) {
  return UserSignInUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
InitiatePasswordResetUseCase initiatePasswordReset(
    InitiatePasswordResetRef ref) {
  return InitiatePasswordResetUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CheckIfNewUserUseCase checkIfNewUser(CheckIfNewUserRef ref) {
  return CheckIfNewUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LogoutUseCase logOut(LogOutRef ref) {
  return LogoutUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ValidateCreateAccountUseCase validateCreateAccount(
    ValidateCreateAccountRef ref) {
  return ValidateCreateAccountUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
SearchUserNinUseCase searchUserNin(SearchUserNinRef ref) {
  return SearchUserNinUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
FetchAllUsernamesUseCase fetchAllUsernames(FetchAllUsernamesRef ref) {
  return FetchAllUsernamesUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UploadProfileImageUseCase uploadProfileImage(UploadProfileImageRef ref) {
  return UploadProfileImageUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ResetUserPasswordUseCase resetUserPassword(ResetUserPasswordRef ref) {
  return ResetUserPasswordUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CurrentUserUseCase currentUser(CurrentUserRef ref) {
  return CurrentUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}
