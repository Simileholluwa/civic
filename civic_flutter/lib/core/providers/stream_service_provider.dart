import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_service_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Project> projectStream(
  Ref ref,
  int projectId,
  Project? project,
) async* {
  if (project != null) {
    yield project;
  }
  final updates = ref.read(clientProvider).project.projectUpdates(projectId);
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<Post> postStream(
  Ref ref,
  int postId,
  Post? post,
) async* {
  if (post != null) {
    yield post;
  }
  final updates = ref.read(clientProvider).post.postUpdates(postId);
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<ProjectReview> projectReviewStream(
  Ref ref,
  int projectReviewId,
  ProjectReview? projectReview,
) async* {
  if (projectReview != null) {
    yield projectReview;
  }
  final updates =
      ref.read(clientProvider).project.projectReviewUpdates(projectReviewId);
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<ProjectVetting> projectVettingStream(
  Ref ref,
  int vettingId,
  ProjectVetting? projectVetting,
) async* {
  if (projectVetting != null) {
    yield projectVetting;
  }
  final updates =
      ref.read(clientProvider).project.projectVettingUpdates(vettingId);
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<UserNotification> userNotificationStream(
  Ref ref,
  int? notificationId,
  UserNotification? notification,
) async* {
  if (notification != null) {
    yield notification;
  }
  if (notificationId != null) {
    final updates = ref
        .read(clientProvider)
        .notification
        .notificationUpdates(notificationId);
    await for (final update in updates) {
      yield update;
    }
  }
}
