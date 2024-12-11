import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'auth_service_provider.g.dart';

@riverpod
AuthRemoteDatabaseImpl authRemoteDatabase(Ref ref) {
  return AuthRemoteDatabaseImpl(
    client: ref.read(clientProvider),
    sessionManager: ref.read(sessionProvider),
    auth: ref.read(authEmailProvider),
  );
}

@riverpod
AuthRepositoryImpl authRepository(Ref ref) {
  return AuthRepositoryImpl(
    remoteDatabase: ref.read(
      authRemoteDatabaseProvider,
    ),
  );
}

@riverpod
CreateAccountRequestUseCase createAccountRequest(Ref ref) {
  return CreateAccountRequestUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UserSignInUseCase userSignIn(Ref ref) {
  return UserSignInUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
InitiatePasswordResetUseCase initiatePasswordReset(
    Ref ref) {
  return InitiatePasswordResetUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CheckIfNewUserUseCase checkIfNewUser(Ref ref) {
  return CheckIfNewUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LogoutUseCase logOut(Ref ref) {
  return LogoutUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ValidateCreateAccountUseCase validateCreateAccount(
    Ref ref) {
  return ValidateCreateAccountUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
SearchUserNinUseCase searchUserNin(Ref ref) {
  return SearchUserNinUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
FetchAllUsernamesUseCase fetchAllUsernames(Ref ref) {
  return FetchAllUsernamesUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UploadProfileImageUseCase uploadProfileImage(Ref ref) {
  return UploadProfileImageUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ResetUserPasswordUseCase resetUserPassword(Ref ref) {
  return ResetUserPasswordUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CurrentUserUseCase currentUser(Ref ref) {
  return CurrentUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}
