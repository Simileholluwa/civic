import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'verify_user_proximity_provider.g.dart';

@riverpod
Future<bool> verifyUserProximity(
  Ref ref, {
  double maxDistance = 1000,
  required List<AWSPlaces> projectLocations,
}) async {
  if (projectLocations.isEmpty) {
    return false;
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
      return true;
    }
  }
  return false;
}
