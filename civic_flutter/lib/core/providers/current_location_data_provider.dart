import 'dart:async';
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_location_data_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class CurrentLocationData extends _$CurrentLocationData {
  @override
  Future<List<double>> build() async {
    final data = await ref.watch(locationServiceProvider).getCurrentPosition();

    return data.fold((error) {
      return [];
    }, (currentPosition) async {
      return currentPosition;
    });
  }
}

@Riverpod(keepAlive: true)
Future<List<AWSPlaces>?> searchNearbyPlaces(SearchNearbyPlacesRef ref) async {
  final currentPosition = await ref.watch(currentLocationDataProvider.future);
  if (currentPosition.isEmpty) {
    return [];
  }
  final locations = await ref.watch(locationServiceProvider).searchNearbyPlaces(
        currentPosition,
      );
  return locations.fold((error) {
    log(error);
    return null;
  }, (loctionData) {
    return loctionData;
  });
}

@Riverpod(keepAlive: true)
Future<List<AWSPlaces>?> searchPlaces(
  SearchPlacesRef ref,
) async {
  const debounceDuration = Duration(milliseconds: 1000);
  final completer = Completer<List<AWSPlaces>?>();
  if (_debounce?.isActive ?? false) _debounce!.cancel();
  final query = ref.watch(locationSearchQueryProvider);

  if (query.isEmpty) {
    final locations = ref.watch(
      searchNearbyPlacesProvider.future,
    );
    return locations;
  }
  _debounce = Timer(debounceDuration, () async {
    try {
      final locations =
          await ref.watch(locationServiceProvider).searchLocation(query);

      locations.fold((error) {
        completer.completeError(error);
        return null;
      }, (locationData) {
        completer.complete(locationData);
        return locationData;
      });
    } catch (e) {
      completer.completeError(e);
    }
  });

  return completer.future;
}

@Riverpod(keepAlive: true)
class LocationSearchQuery extends _$LocationSearchQuery {
  @override
  String build() => '';

  void setSearchQuery(String query) {
    state = query;
  }
}

@riverpod
class SelectLocations extends _$SelectLocations {
  @override
  List<AWSPlaces> build() => <AWSPlaces>[];

  void addLocation(AWSPlaces location) {
    state = [...state, location];
  }

  void removeLocation(AWSPlaces location) {
    state = state.where((loc) => loc.place != location.place).toList();
  }

  void removeAllLocations() {
    state = [];
  }

  void setLocations(List<AWSPlaces> locations) {
    state = [...locations];
  }
}
