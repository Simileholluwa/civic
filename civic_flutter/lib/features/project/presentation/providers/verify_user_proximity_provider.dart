import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'verify_user_proximity_provider.g.dart';

@riverpod
Future<double> verifyUserProximity(
  Ref ref,
  List<AWSPlaces>? projectLocations,
  int? projectId,
) async {
  final completer = Completer<double>();
  if (projectLocations == null) {
    final retrieveProject = ref.read(getProjectProvider);
    final result = await retrieveProject(
      GetProjectParams(
        projectId!,
      ),
    );

    result.fold(
      (error) {
        completer.completeError({
          'message': error,
          'action': 'retry',
        });
      },
      (project) async {
        final userId = ref.read(localStorageProvider).getInt('userId');
        if (project.isDeleted! && project.ownerId == userId) {
          completer.completeError({
            'message':
                'You have deleted this project. Try restoring the project to allow vettings by your constituents.',
            'action': 'restore',
          });
        } else if (project.ownerId == userId) {
          completer.completeError(
            {
              'message': 'Project owners can not vet their own projects.',
              'action': 'share',
            },
          );
        } else if (!project.endDate!.isBefore(DateTime.now())) {
          completer.completeError(
            {
              'message':
                  'This project has not ended. Vettings can not be submitted at this time.',
              'action': 'share',
            },
          );
        } else if (project.isDeleted!) {
          completer.completeError(
            {
              'message':
                  'This project has been deleted by its owner. Vettings can no longer be submitted.',
              'action': 'nothing'
            },
          );
        } else {
          final result = await verifyProximity(
            projectLocations: project.physicalLocations!,
          );
          completer.complete(result);
        }
      },
    );
  } else {
    final result = await verifyProximity(
      projectLocations: projectLocations,
    );
    completer.complete(result);
  }

  return completer.future;
}

Future<double> verifyProximity({
  required List<AWSPlaces> projectLocations,
}) async {
  final userPosition = await ProjectHelperFunctions.getDevicePosition();
  for (final location in projectLocations) {
    final distance = ProjectHelperFunctions.calculateDistance(
      userPosition.latitude,
      userPosition.longitude,
      location.latitude,
      location.longitude,
    );
    return distance / 1000;
  }
  return 0.0;
}
