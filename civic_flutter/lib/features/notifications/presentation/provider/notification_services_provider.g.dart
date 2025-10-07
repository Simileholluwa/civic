// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationRemoteDatasource)
const notificationRemoteDatasourceProvider =
    NotificationRemoteDatasourceProvider._();

final class NotificationRemoteDatasourceProvider extends $FunctionalProvider<
        NotificationRemoteDatasourceImpl,
        NotificationRemoteDatasourceImpl,
        NotificationRemoteDatasourceImpl>
    with $Provider<NotificationRemoteDatasourceImpl> {
  const NotificationRemoteDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationRemoteDatasourceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<NotificationRemoteDatasourceImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotificationRemoteDatasourceImpl create(Ref ref) {
    return notificationRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRemoteDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<NotificationRemoteDatasourceImpl>(value),
    );
  }
}

String _$notificationRemoteDatasourceHash() =>
    r'6f8294fcb8928df585deb76175f99985a4c8a34b';

@ProviderFor(notificationRepositoryImpl)
const notificationRepositoryImplProvider =
    NotificationRepositoryImplProvider._();

final class NotificationRepositoryImplProvider extends $FunctionalProvider<
    NotificationRepositoryImpl,
    NotificationRepositoryImpl,
    NotificationRepositoryImpl> with $Provider<NotificationRepositoryImpl> {
  const NotificationRepositoryImplProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationRepositoryImplProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<NotificationRepositoryImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotificationRepositoryImpl create(Ref ref) {
    return notificationRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepositoryImpl>(value),
    );
  }
}

String _$notificationRepositoryImplHash() =>
    r'2ff9721dfb0fffe82b49936ef5ad557036352cca';

@ProviderFor(getNotifications)
const getNotificationsProvider = GetNotificationsProvider._();

final class GetNotificationsProvider extends $FunctionalProvider<
    GetNotificationsUseCase,
    GetNotificationsUseCase,
    GetNotificationsUseCase> with $Provider<GetNotificationsUseCase> {
  const GetNotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getNotificationsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getNotificationsHash();

  @$internal
  @override
  $ProviderElement<GetNotificationsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetNotificationsUseCase create(Ref ref) {
    return getNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNotificationsUseCase>(value),
    );
  }
}

String _$getNotificationsHash() => r'f789e9b2a96903caed8ecdb8ec31834556f6dcaa';

@ProviderFor(deleteAllNotifications)
const deleteAllNotificationsProvider = DeleteAllNotificationsProvider._();

final class DeleteAllNotificationsProvider extends $FunctionalProvider<
        DeleteAllNotificationsUseCase,
        DeleteAllNotificationsUseCase,
        DeleteAllNotificationsUseCase>
    with $Provider<DeleteAllNotificationsUseCase> {
  const DeleteAllNotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteAllNotificationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteAllNotificationsHash();

  @$internal
  @override
  $ProviderElement<DeleteAllNotificationsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteAllNotificationsUseCase create(Ref ref) {
    return deleteAllNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteAllNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<DeleteAllNotificationsUseCase>(value),
    );
  }
}

String _$deleteAllNotificationsHash() =>
    r'03abb08d9fcc4e0bedd58f0524f31f025a4f1ab7';

@ProviderFor(deleteNotification)
const deleteNotificationProvider = DeleteNotificationProvider._();

final class DeleteNotificationProvider extends $FunctionalProvider<
    DeleteNotificationUseCase,
    DeleteNotificationUseCase,
    DeleteNotificationUseCase> with $Provider<DeleteNotificationUseCase> {
  const DeleteNotificationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteNotificationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteNotificationHash();

  @$internal
  @override
  $ProviderElement<DeleteNotificationUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteNotificationUseCase create(Ref ref) {
    return deleteNotification(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteNotificationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteNotificationUseCase>(value),
    );
  }
}

String _$deleteNotificationHash() =>
    r'6b601b4b292530a6aea271fa7f04377d8ffb14a0';

@ProviderFor(markNotificationAsRead)
const markNotificationAsReadProvider = MarkNotificationAsReadProvider._();

final class MarkNotificationAsReadProvider extends $FunctionalProvider<
        MarkNotificationAsReadUseCase,
        MarkNotificationAsReadUseCase,
        MarkNotificationAsReadUseCase>
    with $Provider<MarkNotificationAsReadUseCase> {
  const MarkNotificationAsReadProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'markNotificationAsReadProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$markNotificationAsReadHash();

  @$internal
  @override
  $ProviderElement<MarkNotificationAsReadUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MarkNotificationAsReadUseCase create(Ref ref) {
    return markNotificationAsRead(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkNotificationAsReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<MarkNotificationAsReadUseCase>(value),
    );
  }
}

String _$markNotificationAsReadHash() =>
    r'a9baa492a4ab5fe3836388f3d888fffab922735a';

@ProviderFor(markAllNotificationAsRead)
const markAllNotificationAsReadProvider = MarkAllNotificationAsReadProvider._();

final class MarkAllNotificationAsReadProvider extends $FunctionalProvider<
        MarkAllNotificationsAsReadUseCase,
        MarkAllNotificationsAsReadUseCase,
        MarkAllNotificationsAsReadUseCase>
    with $Provider<MarkAllNotificationsAsReadUseCase> {
  const MarkAllNotificationAsReadProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'markAllNotificationAsReadProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$markAllNotificationAsReadHash();

  @$internal
  @override
  $ProviderElement<MarkAllNotificationsAsReadUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MarkAllNotificationsAsReadUseCase create(Ref ref) {
    return markAllNotificationAsRead(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkAllNotificationsAsReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<MarkAllNotificationsAsReadUseCase>(value),
    );
  }
}

String _$markAllNotificationAsReadHash() =>
    r'c69418f099cf60d418a6174faf710da160776532';
