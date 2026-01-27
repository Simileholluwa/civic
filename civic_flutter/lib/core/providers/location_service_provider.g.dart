// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationService)
const locationServiceProvider = LocationServiceProvider._();

final class LocationServiceProvider
    extends
        $FunctionalProvider<
          LocationServices,
          LocationServices,
          LocationServices
        >
    with $Provider<LocationServices> {
  const LocationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationServiceHash();

  @$internal
  @override
  $ProviderElement<LocationServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationServices create(Ref ref) {
    return locationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationServices>(value),
    );
  }
}

String _$locationServiceHash() => r'707a437f2650a099ab5bfad3d55a13b4e126f743';

@ProviderFor(CurrentLocationData)
const currentLocationDataProvider = CurrentLocationDataProvider._();

final class CurrentLocationDataProvider
    extends $AsyncNotifierProvider<CurrentLocationData, List<double>> {
  const CurrentLocationDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentLocationDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentLocationDataHash();

  @$internal
  @override
  CurrentLocationData create() => CurrentLocationData();
}

String _$currentLocationDataHash() =>
    r'bb732f0cc3dffd70b95309ed63132bdee7ab474d';

abstract class _$CurrentLocationData extends $AsyncNotifier<List<double>> {
  FutureOr<List<double>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<double>>, List<double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<double>>, List<double>>,
              AsyncValue<List<double>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(searchNearbyPlaces)
const searchNearbyPlacesProvider = SearchNearbyPlacesProvider._();

final class SearchNearbyPlacesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AWSPlaces>?>,
          List<AWSPlaces>?,
          FutureOr<List<AWSPlaces>?>
        >
    with $FutureModifier<List<AWSPlaces>?>, $FutureProvider<List<AWSPlaces>?> {
  const SearchNearbyPlacesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchNearbyPlacesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNearbyPlacesHash();

  @$internal
  @override
  $FutureProviderElement<List<AWSPlaces>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AWSPlaces>?> create(Ref ref) {
    return searchNearbyPlaces(ref);
  }
}

String _$searchNearbyPlacesHash() =>
    r'8e8a47bdeeef2aae5d8c338125eaca9a1b6c6675';

@ProviderFor(searchPlaces)
const searchPlacesProvider = SearchPlacesProvider._();

final class SearchPlacesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AWSPlaces>?>,
          List<AWSPlaces>?,
          FutureOr<List<AWSPlaces>?>
        >
    with $FutureModifier<List<AWSPlaces>?>, $FutureProvider<List<AWSPlaces>?> {
  const SearchPlacesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchPlacesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchPlacesHash();

  @$internal
  @override
  $FutureProviderElement<List<AWSPlaces>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AWSPlaces>?> create(Ref ref) {
    return searchPlaces(ref);
  }
}

String _$searchPlacesHash() => r'dd1728856180890eab5bb85ae6c2e3ed09e14051';

@ProviderFor(LocationSearchQuery)
const locationSearchQueryProvider = LocationSearchQueryProvider._();

final class LocationSearchQueryProvider
    extends $NotifierProvider<LocationSearchQuery, String> {
  const LocationSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationSearchQueryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationSearchQueryHash();

  @$internal
  @override
  LocationSearchQuery create() => LocationSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$locationSearchQueryHash() =>
    r'b4523b0700703ee9233c5a28ab737b676d79830e';

abstract class _$LocationSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectLocations)
const selectLocationsProvider = SelectLocationsProvider._();

final class SelectLocationsProvider
    extends $NotifierProvider<SelectLocations, List<AWSPlaces>> {
  const SelectLocationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectLocationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectLocationsHash();

  @$internal
  @override
  SelectLocations create() => SelectLocations();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AWSPlaces> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AWSPlaces>>(value),
    );
  }
}

String _$selectLocationsHash() => r'3b31f17547d5a6067d96ccb5cd4061553443a40f';

abstract class _$SelectLocations extends $Notifier<List<AWSPlaces>> {
  List<AWSPlaces> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<AWSPlaces>, List<AWSPlaces>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AWSPlaces>, List<AWSPlaces>>,
              List<AWSPlaces>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
