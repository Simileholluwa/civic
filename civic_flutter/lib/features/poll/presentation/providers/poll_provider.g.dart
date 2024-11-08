// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pollsOptionsHash() => r'e6cc52929b433a7ae841ed40fa6f99236e6dfb6f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PollsOptions
    extends BuildlessAutoDisposeNotifier<PollCreationState> {
  late final Poll? poll;

  PollCreationState build(
    Poll? poll,
  );
}

/// See also [PollsOptions].
@ProviderFor(PollsOptions)
const pollsOptionsProvider = PollsOptionsFamily();

/// See also [PollsOptions].
class PollsOptionsFamily extends Family<PollCreationState> {
  /// See also [PollsOptions].
  const PollsOptionsFamily();

  /// See also [PollsOptions].
  PollsOptionsProvider call(
    Poll? poll,
  ) {
    return PollsOptionsProvider(
      poll,
    );
  }

  @override
  PollsOptionsProvider getProviderOverride(
    covariant PollsOptionsProvider provider,
  ) {
    return call(
      provider.poll,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pollsOptionsProvider';
}

/// See also [PollsOptions].
class PollsOptionsProvider
    extends AutoDisposeNotifierProviderImpl<PollsOptions, PollCreationState> {
  /// See also [PollsOptions].
  PollsOptionsProvider(
    Poll? poll,
  ) : this._internal(
          () => PollsOptions()..poll = poll,
          from: pollsOptionsProvider,
          name: r'pollsOptionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pollsOptionsHash,
          dependencies: PollsOptionsFamily._dependencies,
          allTransitiveDependencies:
              PollsOptionsFamily._allTransitiveDependencies,
          poll: poll,
        );

  PollsOptionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poll,
  }) : super.internal();

  final Poll? poll;

  @override
  PollCreationState runNotifierBuild(
    covariant PollsOptions notifier,
  ) {
    return notifier.build(
      poll,
    );
  }

  @override
  Override overrideWith(PollsOptions Function() create) {
    return ProviderOverride(
      origin: this,
      override: PollsOptionsProvider._internal(
        () => create()..poll = poll,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poll: poll,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PollsOptions, PollCreationState>
      createElement() {
    return _PollsOptionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PollsOptionsProvider && other.poll == poll;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poll.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PollsOptionsRef on AutoDisposeNotifierProviderRef<PollCreationState> {
  /// The parameter `poll` of this provider.
  Poll? get poll;
}

class _PollsOptionsProviderElement
    extends AutoDisposeNotifierProviderElement<PollsOptions, PollCreationState>
    with PollsOptionsRef {
  _PollsOptionsProviderElement(super.provider);

  @override
  Poll? get poll => (origin as PollsOptionsProvider).poll;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
