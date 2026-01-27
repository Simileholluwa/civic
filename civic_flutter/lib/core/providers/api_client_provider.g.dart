// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(client)
const clientProvider = ClientProvider._();

final class ClientProvider extends $FunctionalProvider<Client, Client, Client>
    with $Provider<Client> {
  const ClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientHash();

  @$internal
  @override
  $ProviderElement<Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Client create(Ref ref) {
    return client(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Client>(value),
    );
  }
}

String _$clientHash() => r'2198fef6fde7871d338afb7dfa73ec5cebb25d87';

@ProviderFor(session)
const sessionProvider = SessionProvider._();

final class SessionProvider
    extends
        $FunctionalProvider<
          Raw<SessionManager>,
          Raw<SessionManager>,
          Raw<SessionManager>
        >
    with $Provider<Raw<SessionManager>> {
  const SessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionHash();

  @$internal
  @override
  $ProviderElement<Raw<SessionManager>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<SessionManager> create(Ref ref) {
    return session(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<SessionManager> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<SessionManager>>(value),
    );
  }
}

String _$sessionHash() => r'9b5a88b134b0d73282d813be5e40fbc068fff553';

@ProviderFor(authEmail)
const authEmailProvider = AuthEmailProvider._();

final class AuthEmailProvider
    extends
        $FunctionalProvider<
          EmailAuthController,
          EmailAuthController,
          EmailAuthController
        >
    with $Provider<EmailAuthController> {
  const AuthEmailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authEmailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authEmailHash();

  @$internal
  @override
  $ProviderElement<EmailAuthController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmailAuthController create(Ref ref) {
    return authEmail(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmailAuthController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmailAuthController>(value),
    );
  }
}

String _$authEmailHash() => r'f974d821f5445136676a699c4690a732380a0549';
