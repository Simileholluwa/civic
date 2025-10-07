// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_datetime_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostScheduledDateTime)
const postScheduledDateTimeProvider = PostScheduledDateTimeProvider._();

final class PostScheduledDateTimeProvider
    extends $NotifierProvider<PostScheduledDateTime, DateTime?> {
  const PostScheduledDateTimeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'postScheduledDateTimeProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postScheduledDateTimeHash();

  @$internal
  @override
  PostScheduledDateTime create() => PostScheduledDateTime();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime?>(value),
    );
  }
}

String _$postScheduledDateTimeHash() =>
    r'd17d8be8d510aeace7fdcd8b899806948b995d4a';

abstract class _$PostScheduledDateTime extends $Notifier<DateTime?> {
  DateTime? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DateTime?, DateTime?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DateTime?, DateTime?>, DateTime?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
