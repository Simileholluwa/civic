// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserDetails)
const getUserDetailsProvider = GetUserDetailsFamily._();

final class GetUserDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserRecord>,
          UserRecord,
          FutureOr<UserRecord>
        >
    with $FutureModifier<UserRecord>, $FutureProvider<UserRecord> {
  const GetUserDetailsProvider._({
    required GetUserDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getUserDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserDetailsHash();

  @override
  String toString() {
    return r'getUserDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserRecord> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserRecord> create(Ref ref) {
    final argument = this.argument as int;
    return getUserDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserDetailsHash() => r'4aefeaec1c73e3377bba2ee3e3810ed22b9f1a76';

final class GetUserDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserRecord>, int> {
  const GetUserDetailsFamily._()
    : super(
        retry: null,
        name: r'getUserDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserDetailsProvider call(int userId) =>
      GetUserDetailsProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserDetailsProvider';
}
