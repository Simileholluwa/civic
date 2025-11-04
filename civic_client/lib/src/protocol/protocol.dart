/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'poll/poll_vote.dart' as _i2;
import 'general/aws_places.dart' as _i3;
import 'general/link_metadata.dart' as _i4;
import 'general/location_exception.dart' as _i5;
import 'general/post_exception.dart' as _i6;
import 'notification/notification.dart' as _i7;
import 'notification/notification_action_type.dart' as _i8;
import 'notification/notification_list.dart' as _i9;
import 'notification/notification_target_type.dart' as _i10;
import 'notification/notifications_settings.dart' as _i11;
import 'poll/poll.dart' as _i12;
import 'poll/poll_option.dart' as _i13;
import 'article/article.dart' as _i14;
import 'post/hashtags.dart' as _i15;
import 'post/post.dart' as _i16;
import 'post/post_bookmarks.dart' as _i17;
import 'post/post_likes.dart' as _i18;
import 'post/post_list.dart' as _i19;
import 'post/post_not_interested.dart' as _i20;
import 'post/post_notif_sun.dart' as _i21;
import 'post/post_type_enums.dart' as _i22;
import 'post/posts_hashtags.dart' as _i23;
import 'project/project.dart' as _i24;
import 'project/project_bookmarks.dart' as _i25;
import 'user/users_list.dart' as _i26;
import 'project/project_list.dart' as _i27;
import 'project/project_not_interested.dart' as _i28;
import 'project/project_notif_sub.dart' as _i29;
import 'project/project_review.dart' as _i30;
import 'project/project_review_list.dart' as _i31;
import 'project/project_review_reaction.dart' as _i32;
import 'project/project_vet_list.dart' as _i33;
import 'project/project_vetting.dart' as _i34;
import 'project/project_vetting_reaction.dart' as _i35;
import 'user/political_status_enum.dart' as _i36;
import 'user/user_device.dart' as _i37;
import 'user/user_record.dart' as _i38;
import 'project/project_likes.dart' as _i39;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i40;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i41;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i42;
export 'article/article.dart';
export 'general/aws_places.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'general/post_exception.dart';
export 'notification/notification.dart';
export 'notification/notification_action_type.dart';
export 'notification/notification_list.dart';
export 'notification/notification_target_type.dart';
export 'notification/notifications_settings.dart';
export 'poll/poll.dart';
export 'poll/poll_option.dart';
export 'poll/poll_vote.dart';
export 'post/hashtags.dart';
export 'post/post.dart';
export 'post/post_bookmarks.dart';
export 'post/post_likes.dart';
export 'post/post_list.dart';
export 'post/post_not_interested.dart';
export 'post/post_notif_sun.dart';
export 'post/post_type_enums.dart';
export 'post/posts_hashtags.dart';
export 'project/project.dart';
export 'project/project_bookmarks.dart';
export 'project/project_likes.dart';
export 'project/project_list.dart';
export 'project/project_not_interested.dart';
export 'project/project_notif_sub.dart';
export 'project/project_review.dart';
export 'project/project_review_list.dart';
export 'project/project_review_reaction.dart';
export 'project/project_vet_list.dart';
export 'project/project_vetting.dart';
export 'project/project_vetting_reaction.dart';
export 'user/political_status_enum.dart';
export 'user/user_device.dart';
export 'user/user_record.dart';
export 'user/users_list.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.PollVote) {
      return _i2.PollVote.fromJson(data) as T;
    }
    if (t == _i3.AWSPlaces) {
      return _i3.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i4.LinkMetadata) {
      return _i4.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i5.LocationException) {
      return _i5.LocationException.fromJson(data) as T;
    }
    if (t == _i6.ServerSideException) {
      return _i6.ServerSideException.fromJson(data) as T;
    }
    if (t == _i7.Notification) {
      return _i7.Notification.fromJson(data) as T;
    }
    if (t == _i8.NotificationActionType) {
      return _i8.NotificationActionType.fromJson(data) as T;
    }
    if (t == _i9.NotificationList) {
      return _i9.NotificationList.fromJson(data) as T;
    }
    if (t == _i10.NotificationTargetType) {
      return _i10.NotificationTargetType.fromJson(data) as T;
    }
    if (t == _i11.UserNotificationSettings) {
      return _i11.UserNotificationSettings.fromJson(data) as T;
    }
    if (t == _i12.Poll) {
      return _i12.Poll.fromJson(data) as T;
    }
    if (t == _i13.PollOption) {
      return _i13.PollOption.fromJson(data) as T;
    }
    if (t == _i14.Article) {
      return _i14.Article.fromJson(data) as T;
    }
    if (t == _i15.Hashtag) {
      return _i15.Hashtag.fromJson(data) as T;
    }
    if (t == _i16.Post) {
      return _i16.Post.fromJson(data) as T;
    }
    if (t == _i17.PostBookmarks) {
      return _i17.PostBookmarks.fromJson(data) as T;
    }
    if (t == _i18.PostLikes) {
      return _i18.PostLikes.fromJson(data) as T;
    }
    if (t == _i19.PostList) {
      return _i19.PostList.fromJson(data) as T;
    }
    if (t == _i20.PostNotInterested) {
      return _i20.PostNotInterested.fromJson(data) as T;
    }
    if (t == _i21.PostSubscription) {
      return _i21.PostSubscription.fromJson(data) as T;
    }
    if (t == _i22.PostType) {
      return _i22.PostType.fromJson(data) as T;
    }
    if (t == _i23.PostsHashtags) {
      return _i23.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i24.Project) {
      return _i24.Project.fromJson(data) as T;
    }
    if (t == _i25.ProjectBookmarks) {
      return _i25.ProjectBookmarks.fromJson(data) as T;
    }
    if (t == _i26.UsersList) {
      return _i26.UsersList.fromJson(data) as T;
    }
    if (t == _i27.ProjectList) {
      return _i27.ProjectList.fromJson(data) as T;
    }
    if (t == _i28.ProjectNotInterested) {
      return _i28.ProjectNotInterested.fromJson(data) as T;
    }
    if (t == _i29.ProjectSubscription) {
      return _i29.ProjectSubscription.fromJson(data) as T;
    }
    if (t == _i30.ProjectReview) {
      return _i30.ProjectReview.fromJson(data) as T;
    }
    if (t == _i31.ProjectReviewList) {
      return _i31.ProjectReviewList.fromJson(data) as T;
    }
    if (t == _i32.ProjectReviewReaction) {
      return _i32.ProjectReviewReaction.fromJson(data) as T;
    }
    if (t == _i33.ProjectVetList) {
      return _i33.ProjectVetList.fromJson(data) as T;
    }
    if (t == _i34.ProjectVetting) {
      return _i34.ProjectVetting.fromJson(data) as T;
    }
    if (t == _i35.ProjectVettingReaction) {
      return _i35.ProjectVettingReaction.fromJson(data) as T;
    }
    if (t == _i36.PoliticalStatus) {
      return _i36.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i37.UserDevice) {
      return _i37.UserDevice.fromJson(data) as T;
    }
    if (t == _i38.UserRecord) {
      return _i38.UserRecord.fromJson(data) as T;
    }
    if (t == _i39.ProjectLikes) {
      return _i39.ProjectLikes.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.PollVote?>()) {
      return (data != null ? _i2.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AWSPlaces?>()) {
      return (data != null ? _i3.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LinkMetadata?>()) {
      return (data != null ? _i4.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LocationException?>()) {
      return (data != null ? _i5.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ServerSideException?>()) {
      return (data != null ? _i6.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.Notification?>()) {
      return (data != null ? _i7.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.NotificationActionType?>()) {
      return (data != null ? _i8.NotificationActionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.NotificationList?>()) {
      return (data != null ? _i9.NotificationList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.NotificationTargetType?>()) {
      return (data != null ? _i10.NotificationTargetType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.UserNotificationSettings?>()) {
      return (data != null
          ? _i11.UserNotificationSettings.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i12.Poll?>()) {
      return (data != null ? _i12.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PollOption?>()) {
      return (data != null ? _i13.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Article?>()) {
      return (data != null ? _i14.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Hashtag?>()) {
      return (data != null ? _i15.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Post?>()) {
      return (data != null ? _i16.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PostBookmarks?>()) {
      return (data != null ? _i17.PostBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PostLikes?>()) {
      return (data != null ? _i18.PostLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PostList?>()) {
      return (data != null ? _i19.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostNotInterested?>()) {
      return (data != null ? _i20.PostNotInterested.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PostSubscription?>()) {
      return (data != null ? _i21.PostSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PostType?>()) {
      return (data != null ? _i22.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.PostsHashtags?>()) {
      return (data != null ? _i23.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Project?>()) {
      return (data != null ? _i24.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ProjectBookmarks?>()) {
      return (data != null ? _i25.ProjectBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UsersList?>()) {
      return (data != null ? _i26.UsersList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.ProjectList?>()) {
      return (data != null ? _i27.ProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.ProjectNotInterested?>()) {
      return (data != null ? _i28.ProjectNotInterested.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.ProjectSubscription?>()) {
      return (data != null ? _i29.ProjectSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.ProjectReview?>()) {
      return (data != null ? _i30.ProjectReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.ProjectReviewList?>()) {
      return (data != null ? _i31.ProjectReviewList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ProjectReviewReaction?>()) {
      return (data != null ? _i32.ProjectReviewReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.ProjectVetList?>()) {
      return (data != null ? _i33.ProjectVetList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.ProjectVetting?>()) {
      return (data != null ? _i34.ProjectVetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ProjectVettingReaction?>()) {
      return (data != null ? _i35.ProjectVettingReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.PoliticalStatus?>()) {
      return (data != null ? _i36.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.UserDevice?>()) {
      return (data != null ? _i37.UserDevice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.UserRecord?>()) {
      return (data != null ? _i38.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.ProjectLikes?>()) {
      return (data != null ? _i39.ProjectLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i7.Notification>) {
      return (data as List)
          .map((e) => deserialize<_i7.Notification>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i13.PollOption>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.PollOption>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PostsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i38.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i38.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i3.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i38.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i38.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PostsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i16.Post>) {
      return (data as List).map((e) => deserialize<_i16.Post>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i3.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i38.UserRecord>) {
      return (data as List).map((e) => deserialize<_i38.UserRecord>(e)).toList()
          as T;
    }
    if (t == List<_i24.Project>) {
      return (data as List).map((e) => deserialize<_i24.Project>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i30.ProjectReview>) {
      return (data as List)
          .map((e) => deserialize<_i30.ProjectReview>(e))
          .toList() as T;
    }
    if (t == List<_i34.ProjectVetting>) {
      return (data as List)
          .map((e) => deserialize<_i34.ProjectVetting>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i40.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i40.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == List<_i41.UserRecord>) {
      return (data as List).map((e) => deserialize<_i41.UserRecord>(e)).toList()
          as T;
    }
    try {
      return _i42.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.PollVote) {
      return 'PollVote';
    }
    if (data is _i3.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i4.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i5.LocationException) {
      return 'LocationException';
    }
    if (data is _i6.ServerSideException) {
      return 'ServerSideException';
    }
    if (data is _i7.Notification) {
      return 'Notification';
    }
    if (data is _i8.NotificationActionType) {
      return 'NotificationActionType';
    }
    if (data is _i9.NotificationList) {
      return 'NotificationList';
    }
    if (data is _i10.NotificationTargetType) {
      return 'NotificationTargetType';
    }
    if (data is _i11.UserNotificationSettings) {
      return 'UserNotificationSettings';
    }
    if (data is _i12.Poll) {
      return 'Poll';
    }
    if (data is _i13.PollOption) {
      return 'PollOption';
    }
    if (data is _i14.Article) {
      return 'Article';
    }
    if (data is _i15.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i16.Post) {
      return 'Post';
    }
    if (data is _i17.PostBookmarks) {
      return 'PostBookmarks';
    }
    if (data is _i18.PostLikes) {
      return 'PostLikes';
    }
    if (data is _i19.PostList) {
      return 'PostList';
    }
    if (data is _i20.PostNotInterested) {
      return 'PostNotInterested';
    }
    if (data is _i21.PostSubscription) {
      return 'PostSubscription';
    }
    if (data is _i22.PostType) {
      return 'PostType';
    }
    if (data is _i23.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i24.Project) {
      return 'Project';
    }
    if (data is _i25.ProjectBookmarks) {
      return 'ProjectBookmarks';
    }
    if (data is _i26.UsersList) {
      return 'UsersList';
    }
    if (data is _i27.ProjectList) {
      return 'ProjectList';
    }
    if (data is _i28.ProjectNotInterested) {
      return 'ProjectNotInterested';
    }
    if (data is _i29.ProjectSubscription) {
      return 'ProjectSubscription';
    }
    if (data is _i30.ProjectReview) {
      return 'ProjectReview';
    }
    if (data is _i31.ProjectReviewList) {
      return 'ProjectReviewList';
    }
    if (data is _i32.ProjectReviewReaction) {
      return 'ProjectReviewReaction';
    }
    if (data is _i33.ProjectVetList) {
      return 'ProjectVetList';
    }
    if (data is _i34.ProjectVetting) {
      return 'ProjectVetting';
    }
    if (data is _i35.ProjectVettingReaction) {
      return 'ProjectVettingReaction';
    }
    if (data is _i36.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i37.UserDevice) {
      return 'UserDevice';
    }
    if (data is _i38.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i39.ProjectLikes) {
      return 'ProjectLikes';
    }
    className = _i42.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i2.PollVote>(data['data']);
    }
    if (dataClassName == 'AWSPlaces') {
      return deserialize<_i3.AWSPlaces>(data['data']);
    }
    if (dataClassName == 'LinkMetadata') {
      return deserialize<_i4.LinkMetadata>(data['data']);
    }
    if (dataClassName == 'LocationException') {
      return deserialize<_i5.LocationException>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i6.ServerSideException>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i7.Notification>(data['data']);
    }
    if (dataClassName == 'NotificationActionType') {
      return deserialize<_i8.NotificationActionType>(data['data']);
    }
    if (dataClassName == 'NotificationList') {
      return deserialize<_i9.NotificationList>(data['data']);
    }
    if (dataClassName == 'NotificationTargetType') {
      return deserialize<_i10.NotificationTargetType>(data['data']);
    }
    if (dataClassName == 'UserNotificationSettings') {
      return deserialize<_i11.UserNotificationSettings>(data['data']);
    }
    if (dataClassName == 'Poll') {
      return deserialize<_i12.Poll>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i13.PollOption>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i14.Article>(data['data']);
    }
    if (dataClassName == 'Hashtag') {
      return deserialize<_i15.Hashtag>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i16.Post>(data['data']);
    }
    if (dataClassName == 'PostBookmarks') {
      return deserialize<_i17.PostBookmarks>(data['data']);
    }
    if (dataClassName == 'PostLikes') {
      return deserialize<_i18.PostLikes>(data['data']);
    }
    if (dataClassName == 'PostList') {
      return deserialize<_i19.PostList>(data['data']);
    }
    if (dataClassName == 'PostNotInterested') {
      return deserialize<_i20.PostNotInterested>(data['data']);
    }
    if (dataClassName == 'PostSubscription') {
      return deserialize<_i21.PostSubscription>(data['data']);
    }
    if (dataClassName == 'PostType') {
      return deserialize<_i22.PostType>(data['data']);
    }
    if (dataClassName == 'PostsHashtags') {
      return deserialize<_i23.PostsHashtags>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i24.Project>(data['data']);
    }
    if (dataClassName == 'ProjectBookmarks') {
      return deserialize<_i25.ProjectBookmarks>(data['data']);
    }
    if (dataClassName == 'UsersList') {
      return deserialize<_i26.UsersList>(data['data']);
    }
    if (dataClassName == 'ProjectList') {
      return deserialize<_i27.ProjectList>(data['data']);
    }
    if (dataClassName == 'ProjectNotInterested') {
      return deserialize<_i28.ProjectNotInterested>(data['data']);
    }
    if (dataClassName == 'ProjectSubscription') {
      return deserialize<_i29.ProjectSubscription>(data['data']);
    }
    if (dataClassName == 'ProjectReview') {
      return deserialize<_i30.ProjectReview>(data['data']);
    }
    if (dataClassName == 'ProjectReviewList') {
      return deserialize<_i31.ProjectReviewList>(data['data']);
    }
    if (dataClassName == 'ProjectReviewReaction') {
      return deserialize<_i32.ProjectReviewReaction>(data['data']);
    }
    if (dataClassName == 'ProjectVetList') {
      return deserialize<_i33.ProjectVetList>(data['data']);
    }
    if (dataClassName == 'ProjectVetting') {
      return deserialize<_i34.ProjectVetting>(data['data']);
    }
    if (dataClassName == 'ProjectVettingReaction') {
      return deserialize<_i35.ProjectVettingReaction>(data['data']);
    }
    if (dataClassName == 'PoliticalStatus') {
      return deserialize<_i36.PoliticalStatus>(data['data']);
    }
    if (dataClassName == 'UserDevice') {
      return deserialize<_i37.UserDevice>(data['data']);
    }
    if (dataClassName == 'UserRecord') {
      return deserialize<_i38.UserRecord>(data['data']);
    }
    if (dataClassName == 'ProjectLikes') {
      return deserialize<_i39.ProjectLikes>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i42.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
