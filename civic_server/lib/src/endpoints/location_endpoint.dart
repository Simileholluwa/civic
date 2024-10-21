import 'package:civic_server/src/generated/protocol.dart';
import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:serverpod/serverpod.dart';

class LocationEndpoint extends Endpoint {
  Future<List<AWSPlaces>> searchLocation(
    Session session,
    String query,
  ) async {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    try {
      var awsPlaces = <AWSPlaces>[];
      Dio dio = Dio();
      var apiKey = env['LOCATION_API_KEY'];
      const region = 'eu-north-1';
      const placeIndexName = 'civic-loc';

      final requestBody = {
        'Text': query,
        'MaxResults': 20,
      };

      final response = await dio.request(
        'https://places.geo.$region.amazonaws.com/places/v0/indexes/$placeIndexName/search/text?key=$apiKey',
        data: requestBody as Map<String, dynamic>,
        options: Options(
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final result = await response.data as Map<String, dynamic>;
        final places = result['Results'];
        for (final place in places) {
          awsPlaces.add(
            AWSPlaces(
              place: place['Place']['Label'],
              latitude: place['Place']['Geometry']['Point'][1],
              longitude: place['Place']['Geometry']['Point'][0],
            ),
          );
        }
        return awsPlaces;
      } else {
        throw LocationException(
            message: response.statusMessage ?? response.statusCode!.toString());
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      throw LocationException(
        message: e.toString(),
      );
    }
  }

  Future<List<AWSPlaces>> searchNearbyPlaces(
    Session session,
    List<double> position,
  ) async {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    try {
      var awsPlaces = <AWSPlaces>[];
      Dio dio = Dio();
      var apiKey = env['LOCATION_API_KEY'];
      const region = 'eu-north-1';
      const placeIndexName = 'civic-loc';

      final requestBody = {
        'Position': position,
        'MaxResults': 20,
      };

      final response = await dio.request(
        'https://places.geo.$region.amazonaws.com/places/v0/indexes/$placeIndexName/search/position?key=$apiKey',
        data: requestBody as Map<String, dynamic>,
        options: Options(
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final result = await response.data as Map<String, dynamic>;
        final places = result['Results'];
        for (final place in places) {
          awsPlaces.add(
            AWSPlaces(
              place: place['Place']['Label'],
              latitude: place['Place']['Geometry']['Point'][1],
              longitude: place['Place']['Geometry']['Point'][0],
            ),
          );
        }
        return awsPlaces;
      } else {
        throw LocationException(
            message: response.statusMessage ?? response.statusCode!.toString());
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      throw LocationException(
        message: e.toString(),
      );
    }
  }
}
