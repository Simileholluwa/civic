import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:civic_client/civic_client.dart';
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
      return left('Failed to connect to server');
    } on TimeoutException catch (_) {
      return left('The request timed out.');
    } on LocationException catch (e) {
      return left(e.message);
    }catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<AWSPlaces>>> searchNearbyPlaces(
    List<double> position,
  ) async {
    try {
      final response = await client.location.searchNearbyPlaces(position);
      return right(response);
    } on SocketException catch (_) {
      return left('Failed to connect to server');
    } on TimeoutException catch (_) {
      return left('The request timed out.');
    } on LocationException catch (e) {
      return left(e.message);
    }catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<double>>> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return right([position.longitude, position.latitude]);
    } catch (e) {
      log(
        e.toString(),
      );
      return left('Unable to get current location data');
    }
  }
}
