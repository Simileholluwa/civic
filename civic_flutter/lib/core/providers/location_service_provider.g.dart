// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationServiceHash() => r'b6d5d938f470cc52f0bcff0fad8028ed2009fe2f';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = Provider<LocationServices>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = ProviderRef<LocationServices>;
String _$searchNearbyPlacesHash() =>
    r'c33e5eed5cdaf213e001c0274a41645ed7381f34';

/// See also [searchNearbyPlaces].
@ProviderFor(searchNearbyPlaces)
final searchNearbyPlacesProvider = FutureProvider<List<AWSPlaces>?>.internal(
  searchNearbyPlaces,
  name: r'searchNearbyPlacesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchNearbyPlacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchNearbyPlacesRef = FutureProviderRef<List<AWSPlaces>?>;
String _$searchPlacesHash() => r'9bb884eaa568e88e1f7dbf5e01e002c2a0b7374a';

/// See also [searchPlaces].
@ProviderFor(searchPlaces)
final searchPlacesProvider = FutureProvider<List<AWSPlaces>?>.internal(
  searchPlaces,
  name: r'searchPlacesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchPlacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchPlacesRef = FutureProviderRef<List<AWSPlaces>?>;
String _$currentLocationDataHash() =>
    r'bb732f0cc3dffd70b95309ed63132bdee7ab474d';

/// See also [CurrentLocationData].
@ProviderFor(CurrentLocationData)
final currentLocationDataProvider =
    AsyncNotifierProvider<CurrentLocationData, List<double>>.internal(
  CurrentLocationData.new,
  name: r'currentLocationDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentLocationData = AsyncNotifier<List<double>>;
String _$locationSearchQueryHash() =>
    r'977bd474232fbbb3cd91c937854191ca204ea8d4';

/// See also [LocationSearchQuery].
@ProviderFor(LocationSearchQuery)
final locationSearchQueryProvider =
    NotifierProvider<LocationSearchQuery, String>.internal(
  LocationSearchQuery.new,
  name: r'locationSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationSearchQuery = Notifier<String>;
String _$selectLocationsHash() => r'11b97197d98207ebb31d174f2d4714c195aae6ee';

/// See also [SelectLocations].
@ProviderFor(SelectLocations)
final selectLocationsProvider =
    AutoDisposeNotifierProvider<SelectLocations, List<AWSPlaces>>.internal(
  SelectLocations.new,
  name: r'selectLocationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectLocations = AutoDisposeNotifier<List<AWSPlaces>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
