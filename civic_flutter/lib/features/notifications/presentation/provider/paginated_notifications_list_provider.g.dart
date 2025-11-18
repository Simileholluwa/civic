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
    PaginatedNotificationsList, PagingController<int, cc.Notification>> {
  const PaginatedNotificationsListProvider._(
      {required PaginatedNotificationsListFamily super.from,
      required (
        cc.NotificationTargetType?,
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
  Override overrideWithValue(PagingController<int, cc.Notification> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<PagingController<int, cc.Notification>>(value),
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
    r'b779b908e4d5e55dd8b1135d01f9e00d4300b714';

final class PaginatedNotificationsListFamily extends $Family
    with
        $ClassFamilyOverride<
            PaginatedNotificationsList,
            PagingController<int, cc.Notification>,
            PagingController<int, cc.Notification>,
            PagingController<int, cc.Notification>,
            (
              cc.NotificationTargetType?,
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
    cc.NotificationTargetType? targetType,
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
    extends $Notifier<PagingController<int, cc.Notification>> {
  late final _$args = ref.$arg as (
    cc.NotificationTargetType?,
    bool?,
  );
  cc.NotificationTargetType? get targetType => _$args.$1;
  bool? get isRead => _$args.$2;

  PagingController<int, cc.Notification> build(
    cc.NotificationTargetType? targetType,
    bool? isRead,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref as $Ref<PagingController<int, cc.Notification>,
        PagingController<int, cc.Notification>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PagingController<int, cc.Notification>,
            PagingController<int, cc.Notification>>,
        PagingController<int, cc.Notification>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
