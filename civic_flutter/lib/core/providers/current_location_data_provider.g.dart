// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$searchPlacesHash() => r'93be17790ce7b538600c4abcd12b67fc7b293978';

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
    r'8fa5aa9f59b1d00f5971515e61f5a5bea14539b5';

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
String _$selectLocationsHash() => r'5d8101330e9a9ae0664d938cae2f84f03b4b1b08';

/// See also [SelectLocations].
@ProviderFor(SelectLocations)
final selectLocationsProvider =
    NotifierProvider<SelectLocations, List<AWSPlaces>>.internal(
  SelectLocations.new,
  name: r'selectLocationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectLocations = Notifier<List<AWSPlaces>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
