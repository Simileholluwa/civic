import 'dart:async';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  LocationServices({required this.client});

  final Client client;

  Future<Either<String, List<AWSPlaces>>> searchLocation(
    String query,
  ) async {
    try {
      final response = await client.location.searchLocation(query);
      return right(response);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOut);
    } on LocationException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<AWSPlaces>>> searchNearbyPlaces(
    List<double> position,
  ) async {
    try {
      final response = await client.location.searchNearbyLocation(position);
      return right(response);
    } on SocketException catch (_) {
      return left(TTexts.failedToConnectToServer);
    } on TimeoutException catch (_) {
      return left(TTexts.requestTimedOut);
    } on LocationException catch (e) {
      return left(e.message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<double>>> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return right([position.longitude, position.latitude]);
    } on Exception catch (e) {
      return left(
        e.toString(),
      );
    }
  }
}
