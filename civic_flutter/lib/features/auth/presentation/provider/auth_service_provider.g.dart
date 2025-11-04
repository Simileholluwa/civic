// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authLocalDatasource)
const authLocalDatasourceProvider = AuthLocalDatasourceProvider._();

final class AuthLocalDatasourceProvider extends $FunctionalProvider<
    AuthLocalDatasourceImpl,
    AuthLocalDatasourceImpl,
    AuthLocalDatasourceImpl> with $Provider<AuthLocalDatasourceImpl> {
  const AuthLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authLocalDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthLocalDatasourceImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthLocalDatasourceImpl create(Ref ref) {
    return authLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthLocalDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthLocalDatasourceImpl>(value),
    );
  }
}

String _$authLocalDatasourceHash() =>
    r'2f607a386fc73fbff44bbe21b775a23c6bfd8809';

@ProviderFor(authRemoteDatabase)
const authRemoteDatabaseProvider = AuthRemoteDatabaseProvider._();

final class AuthRemoteDatabaseProvider extends $FunctionalProvider<
    AuthRemoteDatabaseImpl,
    AuthRemoteDatabaseImpl,
    AuthRemoteDatabaseImpl> with $Provider<AuthRemoteDatabaseImpl> {
  const AuthRemoteDatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authRemoteDatabaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDatabaseHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDatabaseImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRemoteDatabaseImpl create(Ref ref) {
    return authRemoteDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDatabaseImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDatabaseImpl>(value),
    );
  }
}

String _$authRemoteDatabaseHash() =>
    r'710caa8ddefd406e4f0c893307f64296c0772d4c';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider extends $FunctionalProvider<
    AuthRepositoryImpl,
    AuthRepositoryImpl,
    AuthRepositoryImpl> with $Provider<AuthRepositoryImpl> {
  const AuthRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepositoryImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepositoryImpl create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepositoryImpl>(value),
    );
  }
}

String _$authRepositoryHash() => r'a8ccccfb7339ced909584054d0666dd5ccceaa71';

@ProviderFor(createAccountRequest)
const createAccountRequestProvider = CreateAccountRequestProvider._();

final class CreateAccountRequestProvider extends $FunctionalProvider<
    CreateAccountRequestUseCase,
    CreateAccountRequestUseCase,
    CreateAccountRequestUseCase> with $Provider<CreateAccountRequestUseCase> {
  const CreateAccountRequestProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'createAccountRequestProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createAccountRequestHash();

  @$internal
  @override
  $ProviderElement<CreateAccountRequestUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreateAccountRequestUseCase create(Ref ref) {
    return createAccountRequest(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateAccountRequestUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateAccountRequestUseCase>(value),
    );
  }
}

String _$createAccountRequestHash() =>
    r'b653f1f620cde6ffc3a99bae8ffcdd32534c8323';

@ProviderFor(userSignIn)
const userSignInProvider = UserSignInProvider._();

final class UserSignInProvider extends $FunctionalProvider<UserSignInUseCase,
    UserSignInUseCase, UserSignInUseCase> with $Provider<UserSignInUseCase> {
  const UserSignInProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userSignInProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userSignInHash();

  @$internal
  @override
  $ProviderElement<UserSignInUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserSignInUseCase create(Ref ref) {
    return userSignIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSignInUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSignInUseCase>(value),
    );
  }
}

String _$userSignInHash() => r'2adacc5f69874ed818ff3878e1a329a0d7d6d097';

@ProviderFor(initiatePasswordReset)
const initiatePasswordResetProvider = InitiatePasswordResetProvider._();

final class InitiatePasswordResetProvider extends $FunctionalProvider<
    InitiatePasswordResetUseCase,
    InitiatePasswordResetUseCase,
    InitiatePasswordResetUseCase> with $Provider<InitiatePasswordResetUseCase> {
  const InitiatePasswordResetProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'initiatePasswordResetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$initiatePasswordResetHash();

  @$internal
  @override
  $ProviderElement<InitiatePasswordResetUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InitiatePasswordResetUseCase create(Ref ref) {
    return initiatePasswordReset(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InitiatePasswordResetUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InitiatePasswordResetUseCase>(value),
    );
  }
}

String _$initiatePasswordResetHash() =>
    r'6ec5d95bbb598d2e05c1fc8b5022f0c457dd223b';

@ProviderFor(checkIfNewUser)
const checkIfNewUserProvider = CheckIfNewUserProvider._();

final class CheckIfNewUserProvider extends $FunctionalProvider<
    CheckIfNewUserUseCase,
    CheckIfNewUserUseCase,
    CheckIfNewUserUseCase> with $Provider<CheckIfNewUserUseCase> {
  const CheckIfNewUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'checkIfNewUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checkIfNewUserHash();

  @$internal
  @override
  $ProviderElement<CheckIfNewUserUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CheckIfNewUserUseCase create(Ref ref) {
    return checkIfNewUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckIfNewUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckIfNewUserUseCase>(value),
    );
  }
}

String _$checkIfNewUserHash() => r'dc9f8adbbe994c9c4bff9fc09234cf060ad6f9c9';

@ProviderFor(logOut)
const logOutProvider = LogOutProvider._();

final class LogOutProvider
    extends $FunctionalProvider<LogoutUseCase, LogoutUseCase, LogoutUseCase>
    with $Provider<LogoutUseCase> {
  const LogOutProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'logOutProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$logOutHash();

  @$internal
  @override
  $ProviderElement<LogoutUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUseCase create(Ref ref) {
    return logOut(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUseCase>(value),
    );
  }
}

String _$logOutHash() => r'40db795015672880a5d6e20dda78d2373d1dd3c7';

@ProviderFor(validateCreateAccount)
const validateCreateAccountProvider = ValidateCreateAccountProvider._();

final class ValidateCreateAccountProvider extends $FunctionalProvider<
    ValidateCreateAccountUseCase,
    ValidateCreateAccountUseCase,
    ValidateCreateAccountUseCase> with $Provider<ValidateCreateAccountUseCase> {
  const ValidateCreateAccountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'validateCreateAccountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$validateCreateAccountHash();

  @$internal
  @override
  $ProviderElement<ValidateCreateAccountUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ValidateCreateAccountUseCase create(Ref ref) {
    return validateCreateAccount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValidateCreateAccountUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValidateCreateAccountUseCase>(value),
    );
  }
}

String _$validateCreateAccountHash() =>
    r'33a4d8366c25528612361c575441864125ab8107';

@ProviderFor(searchUserNin)
const searchUserNinProvider = SearchUserNinProvider._();

final class SearchUserNinProvider extends $FunctionalProvider<
    SearchUserNinUseCase,
    SearchUserNinUseCase,
    SearchUserNinUseCase> with $Provider<SearchUserNinUseCase> {
  const SearchUserNinProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchUserNinProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchUserNinHash();

  @$internal
  @override
  $ProviderElement<SearchUserNinUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SearchUserNinUseCase create(Ref ref) {
    return searchUserNin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchUserNinUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchUserNinUseCase>(value),
    );
  }
}

String _$searchUserNinHash() => r'ed11554b209d5982c8764ee68516b4575cb5533f';

@ProviderFor(uploadProfileImage)
const uploadProfileImageProvider = UploadProfileImageProvider._();

final class UploadProfileImageProvider extends $FunctionalProvider<
    UploadProfileImageUseCase,
    UploadProfileImageUseCase,
    UploadProfileImageUseCase> with $Provider<UploadProfileImageUseCase> {
  const UploadProfileImageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'uploadProfileImageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$uploadProfileImageHash();

  @$internal
  @override
  $ProviderElement<UploadProfileImageUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UploadProfileImageUseCase create(Ref ref) {
    return uploadProfileImage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadProfileImageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadProfileImageUseCase>(value),
    );
  }
}

String _$uploadProfileImageHash() =>
    r'ca5bf8b6f7e98b567ffd163d25c5f19a8b1ac2be';

@ProviderFor(resetUserPassword)
const resetUserPasswordProvider = ResetUserPasswordProvider._();

final class ResetUserPasswordProvider extends $FunctionalProvider<
    ResetUserPasswordUseCase,
    ResetUserPasswordUseCase,
    ResetUserPasswordUseCase> with $Provider<ResetUserPasswordUseCase> {
  const ResetUserPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'resetUserPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$resetUserPasswordHash();

  @$internal
  @override
  $ProviderElement<ResetUserPasswordUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResetUserPasswordUseCase create(Ref ref) {
    return resetUserPassword(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetUserPasswordUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetUserPasswordUseCase>(value),
    );
  }
}

String _$resetUserPasswordHash() => r'1373fc6a555622cc6f9bb85cb9f96c9a17392faa';
