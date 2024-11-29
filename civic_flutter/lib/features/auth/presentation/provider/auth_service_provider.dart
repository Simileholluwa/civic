import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
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
