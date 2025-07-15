// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_notifications_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedNotificationsListHash() =>
    r'c39caca83ce0ddf3b182ed87d608521eb62ebf7e';

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

abstract class _$PaginatedNotificationsList
    extends BuildlessNotifier<PagingStatus> {
  late final String targetType;
  late final bool isRead;

  PagingStatus build(
    String targetType, [
    bool isRead = true,
  ]);
}

/// See also [PaginatedNotificationsList].
@ProviderFor(PaginatedNotificationsList)
const paginatedNotificationsListProvider = PaginatedNotificationsListFamily();

/// See also [PaginatedNotificationsList].
class PaginatedNotificationsListFamily extends Family<PagingStatus> {
  /// See also [PaginatedNotificationsList].
  const PaginatedNotificationsListFamily();

  /// See also [PaginatedNotificationsList].
  PaginatedNotificationsListProvider call(
    String targetType, [
    bool isRead = true,
  ]) {
    return PaginatedNotificationsListProvider(
      targetType,
      isRead,
    );
  }

  @override
  PaginatedNotificationsListProvider getProviderOverride(
    covariant PaginatedNotificationsListProvider provider,
  ) {
    return call(
      provider.targetType,
      provider.isRead,
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
  String? get name => r'paginatedNotificationsListProvider';
}

/// See also [PaginatedNotificationsList].
class PaginatedNotificationsListProvider
    extends NotifierProviderImpl<PaginatedNotificationsList, PagingStatus> {
  /// See also [PaginatedNotificationsList].
  PaginatedNotificationsListProvider(
    String targetType, [
    bool isRead = true,
  ]) : this._internal(
          () => PaginatedNotificationsList()
            ..targetType = targetType
            ..isRead = isRead,
          from: paginatedNotificationsListProvider,
          name: r'paginatedNotificationsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedNotificationsListHash,
          dependencies: PaginatedNotificationsListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedNotificationsListFamily._allTransitiveDependencies,
          targetType: targetType,
          isRead: isRead,
        );

  PaginatedNotificationsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetType,
    required this.isRead,
  }) : super.internal();

  final String targetType;
  final bool isRead;

  @override
  PagingStatus runNotifierBuild(
    covariant PaginatedNotificationsList notifier,
  ) {
    return notifier.build(
      targetType,
      isRead,
    );
  }

  @override
  Override overrideWith(PaginatedNotificationsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedNotificationsListProvider._internal(
        () => create()
          ..targetType = targetType
          ..isRead = isRead,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetType: targetType,
        isRead: isRead,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedNotificationsList, PagingStatus>
      createElement() {
    return _PaginatedNotificationsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedNotificationsListProvider &&
        other.targetType == targetType &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetType.hashCode);
    hash = _SystemHash.combine(hash, isRead.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedNotificationsListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `targetType` of this provider.
  String get targetType;

  /// The parameter `isRead` of this provider.
  bool get isRead;
}

class _PaginatedNotificationsListProviderElement
    extends NotifierProviderElement<PaginatedNotificationsList, PagingStatus>
    with PaginatedNotificationsListRef {
  _PaginatedNotificationsListProviderElement(super.provider);

  @override
  String get targetType =>
      (origin as PaginatedNotificationsListProvider).targetType;
  @override
  bool get isRead => (origin as PaginatedNotificationsListProvider).isRead;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
