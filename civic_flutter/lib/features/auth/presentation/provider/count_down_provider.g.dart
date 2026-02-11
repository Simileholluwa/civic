// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_down_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CountdownTimer)
final countdownTimerProvider = CountdownTimerProvider._();

final class CountdownTimerProvider
    extends $NotifierProvider<CountdownTimer, CountdownTimerState> {
  CountdownTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countdownTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countdownTimerHash();

  @$internal
  @override
  CountdownTimer create() => CountdownTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CountdownTimerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CountdownTimerState>(value),
    );
  }
}

String _$countdownTimerHash() => r'463d856236b3b0650b5d644c8380442cf5c028bd';

abstract class _$CountdownTimer extends $Notifier<CountdownTimerState> {
  CountdownTimerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CountdownTimerState, CountdownTimerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CountdownTimerState, CountdownTimerState>,
              CountdownTimerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
