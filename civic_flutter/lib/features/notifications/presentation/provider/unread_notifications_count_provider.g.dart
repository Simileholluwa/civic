// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notifications_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnreadNotificationsCount)
const unreadNotificationsCountProvider = UnreadNotificationsCountProvider._();

final class UnreadNotificationsCountProvider
    extends $NotifierProvider<UnreadNotificationsCount, int> {
  const UnreadNotificationsCountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'unreadNotificationsCountProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$unreadNotificationsCountHash();

  @$internal
  @override
  UnreadNotificationsCount create() => UnreadNotificationsCount();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$unreadNotificationsCountHash() =>
    r'b62ee7b48d1f748badcacb7f835a0725a1dfbe59';

abstract class _$UnreadNotificationsCount extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
