// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pollDetailHash() => r'b758c5b63925d730356b9a3dad0620030e9761ae';

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
    DraftPoll? draftPoll,
    int id,
  ) {
    return PollDetailProvider(
      draftPoll,
      id,
    );
  }

  @override
  PollDetailProvider getProviderOverride(
    covariant PollDetailProvider provider,
  ) {
    return call(
      provider.draftPoll,
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
    DraftPoll? draftPoll,
    int id,
  ) : this._internal(
          (ref) => pollDetail(
            ref as PollDetailRef,
            draftPoll,
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
          draftPoll: draftPoll,
          id: id,
        );

  PollDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.draftPoll,
    required this.id,
  }) : super.internal();

  final DraftPoll? draftPoll;
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
        draftPoll: draftPoll,
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
    return other is PollDetailProvider &&
        other.draftPoll == draftPoll &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, draftPoll.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PollDetailRef on AutoDisposeFutureProviderRef<Poll?> {
  /// The parameter `draftPoll` of this provider.
  DraftPoll? get draftPoll;

  /// The parameter `id` of this provider.
  int get id;
}

class _PollDetailProviderElement extends AutoDisposeFutureProviderElement<Poll?>
    with PollDetailRef {
  _PollDetailProviderElement(super.provider);

  @override
  DraftPoll? get draftPoll => (origin as PollDetailProvider).draftPoll;
  @override
  int get id => (origin as PollDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
