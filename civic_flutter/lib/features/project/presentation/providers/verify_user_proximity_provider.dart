import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'verify_user_proximity_provider.g.dart';

@riverpod
Future<Map<String, dynamic>> verifyUserProximity(
  Ref ref, {
  double maxDistance = 1000,
  required List<AWSPlaces> projectLocations,
}) async {
  if (projectLocations.isEmpty) {
    return {};
  }
  final userPosition = await ProjectHelperFunctions.getDevicePosition();
  for (final location in projectLocations) {
    final distance = ProjectHelperFunctions.calculateDistance(
      userPosition.latitude,
      userPosition.longitude,
      location.latitude,
      location.longitude,
    );
    if (distance <= maxDistance) {
      return {
        'canVet': true,
        'distance': distance,
      };
    } else {
      return {
        'canVet': false,
        'distance': (distance / 1000).toStringAsFixed(2),
      };
    }
    
  }
  return {};
}
