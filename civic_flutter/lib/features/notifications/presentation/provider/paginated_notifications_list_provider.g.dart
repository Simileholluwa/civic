// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_notifications_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedNotificationsList)
const paginatedNotificationsListProvider = PaginatedNotificationsListFamily._();

final class PaginatedNotificationsListProvider extends $NotifierProvider<
    PaginatedNotificationsList, Raw<PagingController<int, AppNotification>>> {
  const PaginatedNotificationsListProvider._(
      {required PaginatedNotificationsListFamily super.from,
      required (
        NotificationTargetType?,
        bool?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'paginatedNotificationsListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginatedNotificationsListHash();

  @override
  String toString() {
    return r'paginatedNotificationsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PaginatedNotificationsList create() => PaginatedNotificationsList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
      Raw<PagingController<int, AppNotification>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Raw<PagingController<int, AppNotification>>>(
              value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedNotificationsListProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedNotificationsListHash() =>
    r'a4308c57ebc6100b528fbe4ac66b659604dd2cdb';

final class PaginatedNotificationsListFamily extends $Family
    with
        $ClassFamilyOverride<
            PaginatedNotificationsList,
            Raw<PagingController<int, AppNotification>>,
            Raw<PagingController<int, AppNotification>>,
            Raw<PagingController<int, AppNotification>>,
            (
              NotificationTargetType?,
              bool?,
            )> {
  const PaginatedNotificationsListFamily._()
      : super(
          retry: null,
          name: r'paginatedNotificationsListProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  PaginatedNotificationsListProvider call(
    NotificationTargetType? targetType,
    bool? isRead,
  ) =>
      PaginatedNotificationsListProvider._(argument: (
        targetType,
        isRead,
      ), from: this);

  @override
  String toString() => r'paginatedNotificationsListProvider';
}

abstract class _$PaginatedNotificationsList
    extends $Notifier<Raw<PagingController<int, AppNotification>>> {
  late final _$args = ref.$arg as (
    NotificationTargetType?,
    bool?,
  );
  NotificationTargetType? get targetType => _$args.$1;
  bool? get isRead => _$args.$2;

  Raw<PagingController<int, AppNotification>> build(
    NotificationTargetType? targetType,
    bool? isRead,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref as $Ref<Raw<PagingController<int, AppNotification>>,
        Raw<PagingController<int, AppNotification>>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Raw<PagingController<int, AppNotification>>,
            Raw<PagingController<int, AppNotification>>>,
        Raw<PagingController<int, AppNotification>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
