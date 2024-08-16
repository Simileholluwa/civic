// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'5724ff4c1c96b67db76e8bdc383e4dee8ae2bad3';

/// See also [client].
@ProviderFor(client)
final clientProvider = AutoDisposeProvider<Client>.internal(
  client,
  name: r'clientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClientRef = AutoDisposeProviderRef<Client>;
String _$sessionHash() => r'7e3da8bfcf726835e19d52196a007f999662601f';

/// See also [session].
@ProviderFor(session)
final sessionProvider = AutoDisposeProvider<Raw<SessionManager>>.internal(
  session,
  name: r'sessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionRef = AutoDisposeProviderRef<Raw<SessionManager>>;
String _$authEmailHash() => r'0d828ec1b8d93777abb5890d015152f9cfe2f7fd';

/// See also [authEmail].
@ProviderFor(authEmail)
final authEmailProvider = AutoDisposeProvider<EmailAuthController>.internal(
  authEmail,
  name: r'authEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthEmailRef = AutoDisposeProviderRef<EmailAuthController>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
