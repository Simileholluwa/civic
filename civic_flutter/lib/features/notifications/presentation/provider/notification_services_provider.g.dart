// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationLocalDatasource)
final notificationLocalDatasourceProvider =
    NotificationLocalDatasourceProvider._();

final class NotificationLocalDatasourceProvider
    extends
        $FunctionalProvider<
          NotificationLocalDatasourceImpl,
          NotificationLocalDatasourceImpl,
          NotificationLocalDatasourceImpl
        >
    with $Provider<NotificationLocalDatasourceImpl> {
  NotificationLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationLocalDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<NotificationLocalDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationLocalDatasourceImpl create(Ref ref) {
    return notificationLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationLocalDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationLocalDatasourceImpl>(
        value,
      ),
    );
  }
}

String _$notificationLocalDatasourceHash() =>
    r'fda7c1d36e842bdb18301ccbe6cd376ae356b9a5';

@ProviderFor(notificationRemoteDatasource)
final notificationRemoteDatasourceProvider =
    NotificationRemoteDatasourceProvider._();

final class NotificationRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          NotificationRemoteDatasourceImpl,
          NotificationRemoteDatasourceImpl,
          NotificationRemoteDatasourceImpl
        >
    with $Provider<NotificationRemoteDatasourceImpl> {
  NotificationRemoteDatasourceProvider._()
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
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRemoteDatasourceImpl create(Ref ref) {
    return notificationRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRemoteDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRemoteDatasourceImpl>(
        value,
      ),
    );
  }
}

String _$notificationRemoteDatasourceHash() =>
    r'382c54f5dbb845e26ae9bfb21cf14da6a376f5cf';

@ProviderFor(notificationRepositoryImpl)
final notificationRepositoryImplProvider =
    NotificationRepositoryImplProvider._();

final class NotificationRepositoryImplProvider
    extends
        $FunctionalProvider<
          NotificationRepositoryImpl,
          NotificationRepositoryImpl,
          NotificationRepositoryImpl
        >
    with $Provider<NotificationRepositoryImpl> {
  NotificationRepositoryImplProvider._()
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
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

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
final getNotificationsProvider = GetNotificationsProvider._();

final class GetNotificationsProvider
    extends
        $FunctionalProvider<
          GetNotificationsUseCase,
          GetNotificationsUseCase,
          GetNotificationsUseCase
        >
    with $Provider<GetNotificationsUseCase> {
  GetNotificationsProvider._()
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
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

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

@ProviderFor(getUserNotificationSettings)
final getUserNotificationSettingsProvider =
    GetUserNotificationSettingsProvider._();

final class GetUserNotificationSettingsProvider
    extends
        $FunctionalProvider<
          GetUserNotificationSettingsUseCase,
          GetUserNotificationSettingsUseCase,
          GetUserNotificationSettingsUseCase
        >
    with $Provider<GetUserNotificationSettingsUseCase> {
  GetUserNotificationSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserNotificationSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserNotificationSettingsHash();

  @$internal
  @override
  $ProviderElement<GetUserNotificationSettingsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetUserNotificationSettingsUseCase create(Ref ref) {
    return getUserNotificationSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserNotificationSettingsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserNotificationSettingsUseCase>(
        value,
      ),
    );
  }
}

String _$getUserNotificationSettingsHash() =>
    r'6c942449fdf2012d0cfaba36a483ab9849cfb693';

@ProviderFor(updateUserNotificationSettings)
final updateUserNotificationSettingsProvider =
    UpdateUserNotificationSettingsProvider._();

final class UpdateUserNotificationSettingsProvider
    extends
        $FunctionalProvider<
          UpdateUserNotificationSettingsUseCase,
          UpdateUserNotificationSettingsUseCase,
          UpdateUserNotificationSettingsUseCase
        >
    with $Provider<UpdateUserNotificationSettingsUseCase> {
  UpdateUserNotificationSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserNotificationSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserNotificationSettingsHash();

  @$internal
  @override
  $ProviderElement<UpdateUserNotificationSettingsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateUserNotificationSettingsUseCase create(Ref ref) {
    return updateUserNotificationSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateUserNotificationSettingsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<UpdateUserNotificationSettingsUseCase>(value),
    );
  }
}

String _$updateUserNotificationSettingsHash() =>
    r'1c149565ac3f0f651a03c3aafdde64b291249b80';

@ProviderFor(deleteAllNotifications)
final deleteAllNotificationsProvider = DeleteAllNotificationsProvider._();

final class DeleteAllNotificationsProvider
    extends
        $FunctionalProvider<
          DeleteAllNotificationsUseCase,
          DeleteAllNotificationsUseCase,
          DeleteAllNotificationsUseCase
        >
    with $Provider<DeleteAllNotificationsUseCase> {
  DeleteAllNotificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteAllNotificationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteAllNotificationsHash();

  @$internal
  @override
  $ProviderElement<DeleteAllNotificationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteAllNotificationsUseCase create(Ref ref) {
    return deleteAllNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteAllNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteAllNotificationsUseCase>(
        value,
      ),
    );
  }
}

String _$deleteAllNotificationsHash() =>
    r'f4d890a760abeefa0ed89ba6e7e7df2876253efd';

@ProviderFor(deleteNotification)
final deleteNotificationProvider = DeleteNotificationProvider._();

final class DeleteNotificationProvider
    extends
        $FunctionalProvider<
          DeleteNotificationUseCase,
          DeleteNotificationUseCase,
          DeleteNotificationUseCase
        >
    with $Provider<DeleteNotificationUseCase> {
  DeleteNotificationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteNotificationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteNotificationHash();

  @$internal
  @override
  $ProviderElement<DeleteNotificationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

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
    r'ccc9f98a1588d45c1070f4489da2a82ba1ace307';

@ProviderFor(markNotificationAsRead)
final markNotificationAsReadProvider = MarkNotificationAsReadProvider._();

final class MarkNotificationAsReadProvider
    extends
        $FunctionalProvider<
          MarkNotificationAsReadUseCase,
          MarkNotificationAsReadUseCase,
          MarkNotificationAsReadUseCase
        >
    with $Provider<MarkNotificationAsReadUseCase> {
  MarkNotificationAsReadProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markNotificationAsReadProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markNotificationAsReadHash();

  @$internal
  @override
  $ProviderElement<MarkNotificationAsReadUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkNotificationAsReadUseCase create(Ref ref) {
    return markNotificationAsRead(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkNotificationAsReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkNotificationAsReadUseCase>(
        value,
      ),
    );
  }
}

String _$markNotificationAsReadHash() =>
    r'3b9b203c2f90c8ba08caaf240d2bcc619407d979';

@ProviderFor(markAllNotificationAsRead)
final markAllNotificationAsReadProvider = MarkAllNotificationAsReadProvider._();

final class MarkAllNotificationAsReadProvider
    extends
        $FunctionalProvider<
          MarkAllNotificationsAsReadUseCase,
          MarkAllNotificationsAsReadUseCase,
          MarkAllNotificationsAsReadUseCase
        >
    with $Provider<MarkAllNotificationsAsReadUseCase> {
  MarkAllNotificationAsReadProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markAllNotificationAsReadProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markAllNotificationAsReadHash();

  @$internal
  @override
  $ProviderElement<MarkAllNotificationsAsReadUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkAllNotificationsAsReadUseCase create(Ref ref) {
    return markAllNotificationAsRead(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkAllNotificationsAsReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkAllNotificationsAsReadUseCase>(
        value,
      ),
    );
  }
}

String _$markAllNotificationAsReadHash() =>
    r'48455bc3d6cf47f25c3ea31d191df05b812e5295';

@ProviderFor(getUnreadNotifications)
final getUnreadNotificationsProvider = GetUnreadNotificationsProvider._();

final class GetUnreadNotificationsProvider
    extends
        $FunctionalProvider<
          GetUnreadNotificationsUseCase,
          GetUnreadNotificationsUseCase,
          GetUnreadNotificationsUseCase
        >
    with $Provider<GetUnreadNotificationsUseCase> {
  GetUnreadNotificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUnreadNotificationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUnreadNotificationsHash();

  @$internal
  @override
  $ProviderElement<GetUnreadNotificationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetUnreadNotificationsUseCase create(Ref ref) {
    return getUnreadNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUnreadNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUnreadNotificationsUseCase>(
        value,
      ),
    );
  }
}

String _$getUnreadNotificationsHash() =>
    r'8bc61f149e300518787b059799c469f8fd1eae06';
