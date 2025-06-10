// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pollCardWidgetHash() => r'9e85f6ebd8589410d85ed8de2206d522fcac88d9';

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

abstract class _$PollCardWidget
    extends BuildlessAutoDisposeNotifier<PollCardState> {
  late final Poll poll;

  PollCardState build(
    Poll poll,
  );
}

/// See also [PollCardWidget].
@ProviderFor(PollCardWidget)
const pollCardWidgetProvider = PollCardWidgetFamily();

/// See also [PollCardWidget].
class PollCardWidgetFamily extends Family<PollCardState> {
  /// See also [PollCardWidget].
  const PollCardWidgetFamily();

  /// See also [PollCardWidget].
  PollCardWidgetProvider call(
    Poll poll,
  ) {
    return PollCardWidgetProvider(
      poll,
    );
  }

  @override
  PollCardWidgetProvider getProviderOverride(
    covariant PollCardWidgetProvider provider,
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
  String? get name => r'pollCardWidgetProvider';
}

/// See also [PollCardWidget].
class PollCardWidgetProvider
    extends AutoDisposeNotifierProviderImpl<PollCardWidget, PollCardState> {
  /// See also [PollCardWidget].
  PollCardWidgetProvider(
    Poll poll,
  ) : this._internal(
          () => PollCardWidget()..poll = poll,
          from: pollCardWidgetProvider,
          name: r'pollCardWidgetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pollCardWidgetHash,
          dependencies: PollCardWidgetFamily._dependencies,
          allTransitiveDependencies:
              PollCardWidgetFamily._allTransitiveDependencies,
          poll: poll,
        );

  PollCardWidgetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poll,
  }) : super.internal();

  final Poll poll;

  @override
  PollCardState runNotifierBuild(
    covariant PollCardWidget notifier,
  ) {
    return notifier.build(
      poll,
    );
  }

  @override
  Override overrideWith(PollCardWidget Function() create) {
    return ProviderOverride(
      origin: this,
      override: PollCardWidgetProvider._internal(
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
  AutoDisposeNotifierProviderElement<PollCardWidget, PollCardState>
      createElement() {
    return _PollCardWidgetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PollCardWidgetProvider && other.poll == poll;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poll.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PollCardWidgetRef on AutoDisposeNotifierProviderRef<PollCardState> {
  /// The parameter `poll` of this provider.
  Poll get poll;
}

class _PollCardWidgetProviderElement
    extends AutoDisposeNotifierProviderElement<PollCardWidget, PollCardState>
    with PollCardWidgetRef {
  _PollCardWidgetProviderElement(super.provider);

  @override
  Poll get poll => (origin as PollCardWidgetProvider).poll;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
