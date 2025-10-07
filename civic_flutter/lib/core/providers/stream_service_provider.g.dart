// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectStream)
const projectStreamProvider = ProjectStreamFamily._();

final class ProjectStreamProvider
    extends $FunctionalProvider<AsyncValue<Project>, Project, Stream<Project>>
    with $FutureModifier<Project>, $StreamProvider<Project> {
  const ProjectStreamProvider._(
      {required ProjectStreamFamily super.from,
      required (
        int,
        Project?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'projectStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectStreamHash();

  @override
  String toString() {
    return r'projectStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<Project> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Project> create(Ref ref) {
    final argument = this.argument as (
      int,
      Project?,
    );
    return projectStream(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectStreamHash() => r'3867216eb4304c6ca0ec942f1e0bb090930fb6b3';

final class ProjectStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<Project>,
            (
              int,
              Project?,
            )> {
  const ProjectStreamFamily._()
      : super(
          retry: null,
          name: r'projectStreamProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ProjectStreamProvider call(
    int projectId,
    Project? project,
  ) =>
      ProjectStreamProvider._(argument: (
        projectId,
        project,
      ), from: this);

  @override
  String toString() => r'projectStreamProvider';
}

@ProviderFor(postStream)
const postStreamProvider = PostStreamFamily._();

final class PostStreamProvider
    extends $FunctionalProvider<AsyncValue<Post>, Post, Stream<Post>>
    with $FutureModifier<Post>, $StreamProvider<Post> {
  const PostStreamProvider._(
      {required PostStreamFamily super.from,
      required (
        int,
        Post?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'postStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postStreamHash();

  @override
  String toString() {
    return r'postStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<Post> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Post> create(Ref ref) {
    final argument = this.argument as (
      int,
      Post?,
    );
    return postStream(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postStreamHash() => r'c3fb29534e7c75f021df0affeb31adae528f202e';

final class PostStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<Post>,
            (
              int,
              Post?,
            )> {
  const PostStreamFamily._()
      : super(
          retry: null,
          name: r'postStreamProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  PostStreamProvider call(
    int postId,
    Post? post,
  ) =>
      PostStreamProvider._(argument: (
        postId,
        post,
      ), from: this);

  @override
  String toString() => r'postStreamProvider';
}

@ProviderFor(projectReviewStream)
const projectReviewStreamProvider = ProjectReviewStreamFamily._();

final class ProjectReviewStreamProvider extends $FunctionalProvider<
        AsyncValue<ProjectReview>, ProjectReview, Stream<ProjectReview>>
    with $FutureModifier<ProjectReview>, $StreamProvider<ProjectReview> {
  const ProjectReviewStreamProvider._(
      {required ProjectReviewStreamFamily super.from,
      required (
        int,
        ProjectReview?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'projectReviewStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectReviewStreamHash();

  @override
  String toString() {
    return r'projectReviewStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<ProjectReview> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<ProjectReview> create(Ref ref) {
    final argument = this.argument as (
      int,
      ProjectReview?,
    );
    return projectReviewStream(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectReviewStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectReviewStreamHash() =>
    r'bc35376124017c77050ad7c9964c56da25a02c1a';

final class ProjectReviewStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<ProjectReview>,
            (
              int,
              ProjectReview?,
            )> {
  const ProjectReviewStreamFamily._()
      : super(
          retry: null,
          name: r'projectReviewStreamProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ProjectReviewStreamProvider call(
    int projectReviewId,
    ProjectReview? projectReview,
  ) =>
      ProjectReviewStreamProvider._(argument: (
        projectReviewId,
        projectReview,
      ), from: this);

  @override
  String toString() => r'projectReviewStreamProvider';
}

@ProviderFor(projectVettingStream)
const projectVettingStreamProvider = ProjectVettingStreamFamily._();

final class ProjectVettingStreamProvider extends $FunctionalProvider<
        AsyncValue<ProjectVetting>, ProjectVetting, Stream<ProjectVetting>>
    with $FutureModifier<ProjectVetting>, $StreamProvider<ProjectVetting> {
  const ProjectVettingStreamProvider._(
      {required ProjectVettingStreamFamily super.from,
      required (
        int,
        ProjectVetting?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'projectVettingStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectVettingStreamHash();

  @override
  String toString() {
    return r'projectVettingStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<ProjectVetting> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<ProjectVetting> create(Ref ref) {
    final argument = this.argument as (
      int,
      ProjectVetting?,
    );
    return projectVettingStream(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectVettingStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectVettingStreamHash() =>
    r'609f5ae979383fa563f25ace1b2ba9667326a710';

final class ProjectVettingStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<ProjectVetting>,
            (
              int,
              ProjectVetting?,
            )> {
  const ProjectVettingStreamFamily._()
      : super(
          retry: null,
          name: r'projectVettingStreamProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ProjectVettingStreamProvider call(
    int vettingId,
    ProjectVetting? projectVetting,
  ) =>
      ProjectVettingStreamProvider._(argument: (
        vettingId,
        projectVetting,
      ), from: this);

  @override
  String toString() => r'projectVettingStreamProvider';
}

@ProviderFor(userNotificationStream)
const userNotificationStreamProvider = UserNotificationStreamFamily._();

final class UserNotificationStreamProvider extends $FunctionalProvider<
        AsyncValue<Notification>, Notification, Stream<Notification>>
    with $FutureModifier<Notification>, $StreamProvider<Notification> {
  const UserNotificationStreamProvider._(
      {required UserNotificationStreamFamily super.from,
      required (
        int?,
        Notification?,
      )
          super.argument})
      : super(
          retry: null,
          name: r'userNotificationStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userNotificationStreamHash();

  @override
  String toString() {
    return r'userNotificationStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<Notification> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Notification> create(Ref ref) {
    final argument = this.argument as (
      int?,
      Notification?,
    );
    return userNotificationStream(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserNotificationStreamProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userNotificationStreamHash() =>
    r'9a487873964bf21f0bf6c31ac97f8777b0419c85';

final class UserNotificationStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
            Stream<Notification>,
            (
              int?,
              Notification?,
            )> {
  const UserNotificationStreamFamily._()
      : super(
          retry: null,
          name: r'userNotificationStreamProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  UserNotificationStreamProvider call(
    int? notificationId,
    Notification? notification,
  ) =>
      UserNotificationStreamProvider._(argument: (
        notificationId,
        notification,
      ), from: this);

  @override
  String toString() => r'userNotificationStreamProvider';
}
