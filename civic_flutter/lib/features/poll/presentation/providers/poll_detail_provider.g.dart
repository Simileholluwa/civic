// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pollDetailHash() => r'27a02e6edd63d54aca361749aa00311d737e6bb6';

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

/// See also [pollDetail].
@ProviderFor(pollDetail)
const pollDetailProvider = PollDetailFamily();

/// See also [pollDetail].
class PollDetailFamily extends Family<AsyncValue<Poll?>> {
  /// See also [pollDetail].
  const PollDetailFamily();

  /// See also [pollDetail].
  PollDetailProvider call(
    int id,
  ) {
    return PollDetailProvider(
      id,
    );
  }

  @override
  PollDetailProvider getProviderOverride(
    covariant PollDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'pollDetailProvider';
}

/// See also [pollDetail].
class PollDetailProvider extends AutoDisposeFutureProvider<Poll?> {
  /// See also [pollDetail].
  PollDetailProvider(
    int id,
  ) : this._internal(
          (ref) => pollDetail(
            ref as PollDetailRef,
            id,
          ),
          from: pollDetailProvider,
          name: r'pollDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pollDetailHash,
          dependencies: PollDetailFamily._dependencies,
          allTransitiveDependencies:
              PollDetailFamily._allTransitiveDependencies,
          id: id,
        );

  PollDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Poll?> Function(PollDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PollDetailProvider._internal(
        (ref) => create(ref as PollDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Poll?> createElement() {
    return _PollDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PollDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PollDetailRef on AutoDisposeFutureProviderRef<Poll?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PollDetailProviderElement extends AutoDisposeFutureProviderElement<Poll?>
    with PollDetailRef {
  _PollDetailProviderElement(super.provider);

  @override
  int get id => (origin as PollDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
