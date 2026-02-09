/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'article/article.dart' as _i2;
import 'future/media_cleanup_params.dart' as _i3;
import 'general/aws_places.dart' as _i4;
import 'general/link_metadata.dart' as _i5;
import 'general/location_exception.dart' as _i6;
import 'general/post_exception.dart' as _i7;
import 'media/media_asset.dart' as _i8;
import 'media/media_kind.dart' as _i9;
import 'notification/notification.dart' as _i10;
import 'notification/notification_action_type.dart' as _i11;
import 'notification/notification_list.dart' as _i12;
import 'notification/notification_target_type.dart' as _i13;
import 'notification/notifications_settings.dart' as _i14;
import 'poll/poll.dart' as _i15;
import 'poll/poll_counts.dart' as _i16;
import 'poll/poll_option.dart' as _i17;
import 'poll/poll_option_count.dart' as _i18;
import 'poll/poll_vote.dart' as _i19;
import 'post/engagement_event.dart' as _i20;
import 'post/hashtags.dart' as _i21;
import 'post/impression_log.dart' as _i22;
import 'post/post.dart' as _i23;
import 'post/post_bookmarks.dart' as _i24;
import 'post/post_counts.dart' as _i25;
import 'post/post_impression.dart' as _i26;
import 'post/post_likes.dart' as _i27;
import 'post/post_list.dart' as _i28;
import 'post/post_not_interested.dart' as _i29;
import 'post/post_notif_sub.dart' as _i30;
import 'post/post_quotes.dart' as _i31;
import 'post/post_reposts.dart' as _i32;
import 'post/post_type_enums.dart' as _i33;
import 'post/post_with_user_state.dart' as _i34;
import 'post/posts_hashtags.dart' as _i35;
import 'project/feed_project_list.dart' as _i36;
import 'project/project.dart' as _i37;
import 'project/project_bookmarks.dart' as _i38;
import 'project/project_counts.dart' as _i39;
import 'project/project_likes.dart' as _i40;
import 'project/project_not_interested.dart' as _i41;
import 'project/project_notif_sub.dart' as _i42;
import 'project/project_rating.dart' as _i43;
import 'project/project_rating_counts.dart' as _i44;
import 'project/project_review.dart' as _i45;
import 'project/project_review_counts.dart' as _i46;
import 'project/project_review_list.dart' as _i47;
import 'project/project_review_reaction.dart' as _i48;
import 'project/project_review_with_user_state.dart' as _i49;
import 'project/project_vet_list.dart' as _i50;
import 'project/project_vetting.dart' as _i51;
import 'project/project_vetting_reaction.dart' as _i52;
import 'project/project_vetting_with_user_state.dart' as _i53;
import 'project/project_vettings_count.dart' as _i54;
import 'project/project_with_user_state.dart' as _i55;
import 'project/rating_dimension.dart' as _i56;
import 'user/political_status_enum.dart' as _i57;
import 'user/user_device.dart' as _i58;
import 'user/user_follow.dart' as _i59;
import 'user/user_record.dart' as _i60;
import 'user/users_list.dart' as _i61;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i62;
import 'package:civic_client/src/protocol/media/media_asset.dart' as _i63;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i64;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i65;
export 'article/article.dart';
export 'future/media_cleanup_params.dart';
export 'general/aws_places.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'general/post_exception.dart';
export 'media/media_asset.dart';
export 'media/media_kind.dart';
export 'notification/notification.dart';
export 'notification/notification_action_type.dart';
export 'notification/notification_list.dart';
export 'notification/notification_target_type.dart';
export 'notification/notifications_settings.dart';
export 'poll/poll.dart';
export 'poll/poll_counts.dart';
export 'poll/poll_option.dart';
export 'poll/poll_option_count.dart';
export 'poll/poll_vote.dart';
export 'post/engagement_event.dart';
export 'post/hashtags.dart';
export 'post/impression_log.dart';
export 'post/post.dart';
export 'post/post_bookmarks.dart';
export 'post/post_counts.dart';
export 'post/post_impression.dart';
export 'post/post_likes.dart';
export 'post/post_list.dart';
export 'post/post_not_interested.dart';
export 'post/post_notif_sub.dart';
export 'post/post_quotes.dart';
export 'post/post_reposts.dart';
export 'post/post_type_enums.dart';
export 'post/post_with_user_state.dart';
export 'post/posts_hashtags.dart';
export 'project/feed_project_list.dart';
export 'project/project.dart';
export 'project/project_bookmarks.dart';
export 'project/project_counts.dart';
export 'project/project_likes.dart';
export 'project/project_not_interested.dart';
export 'project/project_notif_sub.dart';
export 'project/project_rating.dart';
export 'project/project_rating_counts.dart';
export 'project/project_review.dart';
export 'project/project_review_counts.dart';
export 'project/project_review_list.dart';
export 'project/project_review_reaction.dart';
export 'project/project_review_with_user_state.dart';
export 'project/project_vet_list.dart';
export 'project/project_vetting.dart';
export 'project/project_vetting_reaction.dart';
export 'project/project_vetting_with_user_state.dart';
export 'project/project_vettings_count.dart';
export 'project/project_with_user_state.dart';
export 'project/rating_dimension.dart';
export 'user/political_status_enum.dart';
export 'user/user_device.dart';
export 'user/user_follow.dart';
export 'user/user_record.dart';
export 'user/users_list.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Article) {
      return _i2.Article.fromJson(data) as T;
    }
    if (t == _i3.MediaCleanupParams) {
      return _i3.MediaCleanupParams.fromJson(data) as T;
    }
    if (t == _i4.AWSPlaces) {
      return _i4.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i5.LinkMetadata) {
      return _i5.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i6.LocationException) {
      return _i6.LocationException.fromJson(data) as T;
    }
    if (t == _i7.ServerSideException) {
      return _i7.ServerSideException.fromJson(data) as T;
    }
    if (t == _i8.MediaAsset) {
      return _i8.MediaAsset.fromJson(data) as T;
    }
    if (t == _i9.MediaKind) {
      return _i9.MediaKind.fromJson(data) as T;
    }
    if (t == _i10.AppNotification) {
      return _i10.AppNotification.fromJson(data) as T;
    }
    if (t == _i11.NotificationActionType) {
      return _i11.NotificationActionType.fromJson(data) as T;
    }
    if (t == _i12.NotificationList) {
      return _i12.NotificationList.fromJson(data) as T;
    }
    if (t == _i13.NotificationTargetType) {
      return _i13.NotificationTargetType.fromJson(data) as T;
    }
    if (t == _i14.UserNotificationSettings) {
      return _i14.UserNotificationSettings.fromJson(data) as T;
    }
    if (t == _i15.Poll) {
      return _i15.Poll.fromJson(data) as T;
    }
    if (t == _i16.PollCounts) {
      return _i16.PollCounts.fromJson(data) as T;
    }
    if (t == _i17.PollOption) {
      return _i17.PollOption.fromJson(data) as T;
    }
    if (t == _i18.PollOptionCount) {
      return _i18.PollOptionCount.fromJson(data) as T;
    }
    if (t == _i19.PollVote) {
      return _i19.PollVote.fromJson(data) as T;
    }
    if (t == _i20.EngagementEvent) {
      return _i20.EngagementEvent.fromJson(data) as T;
    }
    if (t == _i21.Hashtag) {
      return _i21.Hashtag.fromJson(data) as T;
    }
    if (t == _i22.ImpressionLog) {
      return _i22.ImpressionLog.fromJson(data) as T;
    }
    if (t == _i23.Post) {
      return _i23.Post.fromJson(data) as T;
    }
    if (t == _i24.PostBookmarks) {
      return _i24.PostBookmarks.fromJson(data) as T;
    }
    if (t == _i25.PostCounts) {
      return _i25.PostCounts.fromJson(data) as T;
    }
    if (t == _i26.PostImpression) {
      return _i26.PostImpression.fromJson(data) as T;
    }
    if (t == _i27.PostLikes) {
      return _i27.PostLikes.fromJson(data) as T;
    }
    if (t == _i28.PostList) {
      return _i28.PostList.fromJson(data) as T;
    }
    if (t == _i29.PostNotInterested) {
      return _i29.PostNotInterested.fromJson(data) as T;
    }
    if (t == _i30.PostSubscription) {
      return _i30.PostSubscription.fromJson(data) as T;
    }
    if (t == _i31.PostQuotes) {
      return _i31.PostQuotes.fromJson(data) as T;
    }
    if (t == _i32.PostReposts) {
      return _i32.PostReposts.fromJson(data) as T;
    }
    if (t == _i33.PostType) {
      return _i33.PostType.fromJson(data) as T;
    }
    if (t == _i34.PostWithUserState) {
      return _i34.PostWithUserState.fromJson(data) as T;
    }
    if (t == _i35.PostsHashtags) {
      return _i35.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i36.FeedProjectList) {
      return _i36.FeedProjectList.fromJson(data) as T;
    }
    if (t == _i37.Project) {
      return _i37.Project.fromJson(data) as T;
    }
    if (t == _i38.ProjectBookmarks) {
      return _i38.ProjectBookmarks.fromJson(data) as T;
    }
    if (t == _i39.ProjectCounts) {
      return _i39.ProjectCounts.fromJson(data) as T;
    }
    if (t == _i40.ProjectLikes) {
      return _i40.ProjectLikes.fromJson(data) as T;
    }
    if (t == _i41.ProjectNotInterested) {
      return _i41.ProjectNotInterested.fromJson(data) as T;
    }
    if (t == _i42.ProjectSubscription) {
      return _i42.ProjectSubscription.fromJson(data) as T;
    }
    if (t == _i43.ProjectRating) {
      return _i43.ProjectRating.fromJson(data) as T;
    }
    if (t == _i44.ProjectRatingCounts) {
      return _i44.ProjectRatingCounts.fromJson(data) as T;
    }
    if (t == _i45.ProjectReview) {
      return _i45.ProjectReview.fromJson(data) as T;
    }
    if (t == _i46.ProjectReviewCounts) {
      return _i46.ProjectReviewCounts.fromJson(data) as T;
    }
    if (t == _i47.ProjectReviewList) {
      return _i47.ProjectReviewList.fromJson(data) as T;
    }
    if (t == _i48.ProjectReviewReaction) {
      return _i48.ProjectReviewReaction.fromJson(data) as T;
    }
    if (t == _i49.ProjectReviewWithUserState) {
      return _i49.ProjectReviewWithUserState.fromJson(data) as T;
    }
    if (t == _i50.ProjectVetList) {
      return _i50.ProjectVetList.fromJson(data) as T;
    }
    if (t == _i51.ProjectVetting) {
      return _i51.ProjectVetting.fromJson(data) as T;
    }
    if (t == _i52.ProjectVettingReaction) {
      return _i52.ProjectVettingReaction.fromJson(data) as T;
    }
    if (t == _i53.ProjectVettingWithUserState) {
      return _i53.ProjectVettingWithUserState.fromJson(data) as T;
    }
    if (t == _i54.ProjectVettingsCount) {
      return _i54.ProjectVettingsCount.fromJson(data) as T;
    }
    if (t == _i55.ProjectWithUserState) {
      return _i55.ProjectWithUserState.fromJson(data) as T;
    }
    if (t == _i56.RatingDimension) {
      return _i56.RatingDimension.fromJson(data) as T;
    }
    if (t == _i57.PoliticalStatus) {
      return _i57.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i58.UserDevice) {
      return _i58.UserDevice.fromJson(data) as T;
    }
    if (t == _i59.UserFollow) {
      return _i59.UserFollow.fromJson(data) as T;
    }
    if (t == _i60.UserRecord) {
      return _i60.UserRecord.fromJson(data) as T;
    }
    if (t == _i61.UsersList) {
      return _i61.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Article?>()) {
      return (data != null ? _i2.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.MediaCleanupParams?>()) {
      return (data != null ? _i3.MediaCleanupParams.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AWSPlaces?>()) {
      return (data != null ? _i4.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LinkMetadata?>()) {
      return (data != null ? _i5.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.LocationException?>()) {
      return (data != null ? _i6.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ServerSideException?>()) {
      return (data != null ? _i7.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.MediaAsset?>()) {
      return (data != null ? _i8.MediaAsset.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MediaKind?>()) {
      return (data != null ? _i9.MediaKind.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AppNotification?>()) {
      return (data != null ? _i10.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.NotificationActionType?>()) {
      return (data != null ? _i11.NotificationActionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.NotificationList?>()) {
      return (data != null ? _i12.NotificationList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.NotificationTargetType?>()) {
      return (data != null ? _i13.NotificationTargetType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.UserNotificationSettings?>()) {
      return (data != null
              ? _i14.UserNotificationSettings.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.Poll?>()) {
      return (data != null ? _i15.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PollCounts?>()) {
      return (data != null ? _i16.PollCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PollOption?>()) {
      return (data != null ? _i17.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PollOptionCount?>()) {
      return (data != null ? _i18.PollOptionCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PollVote?>()) {
      return (data != null ? _i19.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.EngagementEvent?>()) {
      return (data != null ? _i20.EngagementEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Hashtag?>()) {
      return (data != null ? _i21.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.ImpressionLog?>()) {
      return (data != null ? _i22.ImpressionLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Post?>()) {
      return (data != null ? _i23.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PostBookmarks?>()) {
      return (data != null ? _i24.PostBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PostCounts?>()) {
      return (data != null ? _i25.PostCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PostImpression?>()) {
      return (data != null ? _i26.PostImpression.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PostLikes?>()) {
      return (data != null ? _i27.PostLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PostList?>()) {
      return (data != null ? _i28.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PostNotInterested?>()) {
      return (data != null ? _i29.PostNotInterested.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PostSubscription?>()) {
      return (data != null ? _i30.PostSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.PostQuotes?>()) {
      return (data != null ? _i31.PostQuotes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.PostReposts?>()) {
      return (data != null ? _i32.PostReposts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.PostType?>()) {
      return (data != null ? _i33.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PostWithUserState?>()) {
      return (data != null ? _i34.PostWithUserState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PostsHashtags?>()) {
      return (data != null ? _i35.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.FeedProjectList?>()) {
      return (data != null ? _i36.FeedProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.Project?>()) {
      return (data != null ? _i37.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.ProjectBookmarks?>()) {
      return (data != null ? _i38.ProjectBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.ProjectCounts?>()) {
      return (data != null ? _i39.ProjectCounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.ProjectLikes?>()) {
      return (data != null ? _i40.ProjectLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.ProjectNotInterested?>()) {
      return (data != null ? _i41.ProjectNotInterested.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.ProjectSubscription?>()) {
      return (data != null ? _i42.ProjectSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.ProjectRating?>()) {
      return (data != null ? _i43.ProjectRating.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.ProjectRatingCounts?>()) {
      return (data != null ? _i44.ProjectRatingCounts.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.ProjectReview?>()) {
      return (data != null ? _i45.ProjectReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.ProjectReviewCounts?>()) {
      return (data != null ? _i46.ProjectReviewCounts.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.ProjectReviewList?>()) {
      return (data != null ? _i47.ProjectReviewList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.ProjectReviewReaction?>()) {
      return (data != null ? _i48.ProjectReviewReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.ProjectReviewWithUserState?>()) {
      return (data != null
              ? _i49.ProjectReviewWithUserState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i50.ProjectVetList?>()) {
      return (data != null ? _i50.ProjectVetList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.ProjectVetting?>()) {
      return (data != null ? _i51.ProjectVetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.ProjectVettingReaction?>()) {
      return (data != null ? _i52.ProjectVettingReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.ProjectVettingWithUserState?>()) {
      return (data != null
              ? _i53.ProjectVettingWithUserState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i54.ProjectVettingsCount?>()) {
      return (data != null ? _i54.ProjectVettingsCount.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.ProjectWithUserState?>()) {
      return (data != null ? _i55.ProjectWithUserState.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.RatingDimension?>()) {
      return (data != null ? _i56.RatingDimension.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.PoliticalStatus?>()) {
      return (data != null ? _i57.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.UserDevice?>()) {
      return (data != null ? _i58.UserDevice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.UserFollow?>()) {
      return (data != null ? _i59.UserFollow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.UserRecord?>()) {
      return (data != null ? _i60.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.UsersList?>()) {
      return (data != null ? _i61.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i10.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i10.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_i17.PollOption>) {
      return (data as List).map((e) => deserialize<_i17.PollOption>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.PollOption>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.PollOption>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i18.PollOptionCount>) {
      return (data as List)
              .map((e) => deserialize<_i18.PollOptionCount>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.PollOptionCount>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.PollOptionCount>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i35.PostsHashtags>) {
      return (data as List)
              .map((e) => deserialize<_i35.PostsHashtags>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i35.PostsHashtags>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i35.PostsHashtags>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i8.MediaAsset>) {
      return (data as List).map((e) => deserialize<_i8.MediaAsset>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i8.MediaAsset>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i8.MediaAsset>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i60.UserRecord>) {
      return (data as List).map((e) => deserialize<_i60.UserRecord>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i60.UserRecord>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i60.UserRecord>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i4.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i4.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.AWSPlaces>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i4.AWSPlaces>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i34.PostWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i34.PostWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.ProjectWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i55.ProjectWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.ProjectReviewWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i49.ProjectReviewWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.ProjectVettingWithUserState>) {
      return (data as List)
              .map((e) => deserialize<_i53.ProjectVettingWithUserState>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i62.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i62.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == Map<String, String?>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String?>(v)),
          )
          as T;
    }
    if (t == List<_i63.MediaAsset>) {
      return (data as List).map((e) => deserialize<_i63.MediaAsset>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i64.UserRecord>) {
      return (data as List).map((e) => deserialize<_i64.UserRecord>(e)).toList()
          as T;
    }
    try {
      return _i65.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Article => 'Article',
      _i3.MediaCleanupParams => 'MediaCleanupParams',
      _i4.AWSPlaces => 'AWSPlaces',
      _i5.LinkMetadata => 'LinkMetadata',
      _i6.LocationException => 'LocationException',
      _i7.ServerSideException => 'ServerSideException',
      _i8.MediaAsset => 'MediaAsset',
      _i9.MediaKind => 'MediaKind',
      _i10.AppNotification => 'AppNotification',
      _i11.NotificationActionType => 'NotificationActionType',
      _i12.NotificationList => 'NotificationList',
      _i13.NotificationTargetType => 'NotificationTargetType',
      _i14.UserNotificationSettings => 'UserNotificationSettings',
      _i15.Poll => 'Poll',
      _i16.PollCounts => 'PollCounts',
      _i17.PollOption => 'PollOption',
      _i18.PollOptionCount => 'PollOptionCount',
      _i19.PollVote => 'PollVote',
      _i20.EngagementEvent => 'EngagementEvent',
      _i21.Hashtag => 'Hashtag',
      _i22.ImpressionLog => 'ImpressionLog',
      _i23.Post => 'Post',
      _i24.PostBookmarks => 'PostBookmarks',
      _i25.PostCounts => 'PostCounts',
      _i26.PostImpression => 'PostImpression',
      _i27.PostLikes => 'PostLikes',
      _i28.PostList => 'PostList',
      _i29.PostNotInterested => 'PostNotInterested',
      _i30.PostSubscription => 'PostSubscription',
      _i31.PostQuotes => 'PostQuotes',
      _i32.PostReposts => 'PostReposts',
      _i33.PostType => 'PostType',
      _i34.PostWithUserState => 'PostWithUserState',
      _i35.PostsHashtags => 'PostsHashtags',
      _i36.FeedProjectList => 'FeedProjectList',
      _i37.Project => 'Project',
      _i38.ProjectBookmarks => 'ProjectBookmarks',
      _i39.ProjectCounts => 'ProjectCounts',
      _i40.ProjectLikes => 'ProjectLikes',
      _i41.ProjectNotInterested => 'ProjectNotInterested',
      _i42.ProjectSubscription => 'ProjectSubscription',
      _i43.ProjectRating => 'ProjectRating',
      _i44.ProjectRatingCounts => 'ProjectRatingCounts',
      _i45.ProjectReview => 'ProjectReview',
      _i46.ProjectReviewCounts => 'ProjectReviewCounts',
      _i47.ProjectReviewList => 'ProjectReviewList',
      _i48.ProjectReviewReaction => 'ProjectReviewReaction',
      _i49.ProjectReviewWithUserState => 'ProjectReviewWithUserState',
      _i50.ProjectVetList => 'ProjectVetList',
      _i51.ProjectVetting => 'ProjectVetting',
      _i52.ProjectVettingReaction => 'ProjectVettingReaction',
      _i53.ProjectVettingWithUserState => 'ProjectVettingWithUserState',
      _i54.ProjectVettingsCount => 'ProjectVettingsCount',
      _i55.ProjectWithUserState => 'ProjectWithUserState',
      _i56.RatingDimension => 'RatingDimension',
      _i57.PoliticalStatus => 'PoliticalStatus',
      _i58.UserDevice => 'UserDevice',
      _i59.UserFollow => 'UserFollow',
      _i60.UserRecord => 'UserRecord',
      _i61.UsersList => 'UsersList',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('civic.', '');
    }

    switch (data) {
      case _i2.Article():
        return 'Article';
      case _i3.MediaCleanupParams():
        return 'MediaCleanupParams';
      case _i4.AWSPlaces():
        return 'AWSPlaces';
      case _i5.LinkMetadata():
        return 'LinkMetadata';
      case _i6.LocationException():
        return 'LocationException';
      case _i7.ServerSideException():
        return 'ServerSideException';
      case _i8.MediaAsset():
        return 'MediaAsset';
      case _i9.MediaKind():
        return 'MediaKind';
      case _i10.AppNotification():
        return 'AppNotification';
      case _i11.NotificationActionType():
        return 'NotificationActionType';
      case _i12.NotificationList():
        return 'NotificationList';
      case _i13.NotificationTargetType():
        return 'NotificationTargetType';
      case _i14.UserNotificationSettings():
        return 'UserNotificationSettings';
      case _i15.Poll():
        return 'Poll';
      case _i16.PollCounts():
        return 'PollCounts';
      case _i17.PollOption():
        return 'PollOption';
      case _i18.PollOptionCount():
        return 'PollOptionCount';
      case _i19.PollVote():
        return 'PollVote';
      case _i20.EngagementEvent():
        return 'EngagementEvent';
      case _i21.Hashtag():
        return 'Hashtag';
      case _i22.ImpressionLog():
        return 'ImpressionLog';
      case _i23.Post():
        return 'Post';
      case _i24.PostBookmarks():
        return 'PostBookmarks';
      case _i25.PostCounts():
        return 'PostCounts';
      case _i26.PostImpression():
        return 'PostImpression';
      case _i27.PostLikes():
        return 'PostLikes';
      case _i28.PostList():
        return 'PostList';
      case _i29.PostNotInterested():
        return 'PostNotInterested';
      case _i30.PostSubscription():
        return 'PostSubscription';
      case _i31.PostQuotes():
        return 'PostQuotes';
      case _i32.PostReposts():
        return 'PostReposts';
      case _i33.PostType():
        return 'PostType';
      case _i34.PostWithUserState():
        return 'PostWithUserState';
      case _i35.PostsHashtags():
        return 'PostsHashtags';
      case _i36.FeedProjectList():
        return 'FeedProjectList';
      case _i37.Project():
        return 'Project';
      case _i38.ProjectBookmarks():
        return 'ProjectBookmarks';
      case _i39.ProjectCounts():
        return 'ProjectCounts';
      case _i40.ProjectLikes():
        return 'ProjectLikes';
      case _i41.ProjectNotInterested():
        return 'ProjectNotInterested';
      case _i42.ProjectSubscription():
        return 'ProjectSubscription';
      case _i43.ProjectRating():
        return 'ProjectRating';
      case _i44.ProjectRatingCounts():
        return 'ProjectRatingCounts';
      case _i45.ProjectReview():
        return 'ProjectReview';
      case _i46.ProjectReviewCounts():
        return 'ProjectReviewCounts';
      case _i47.ProjectReviewList():
        return 'ProjectReviewList';
      case _i48.ProjectReviewReaction():
        return 'ProjectReviewReaction';
      case _i49.ProjectReviewWithUserState():
        return 'ProjectReviewWithUserState';
      case _i50.ProjectVetList():
        return 'ProjectVetList';
      case _i51.ProjectVetting():
        return 'ProjectVetting';
      case _i52.ProjectVettingReaction():
        return 'ProjectVettingReaction';
      case _i53.ProjectVettingWithUserState():
        return 'ProjectVettingWithUserState';
      case _i54.ProjectVettingsCount():
        return 'ProjectVettingsCount';
      case _i55.ProjectWithUserState():
        return 'ProjectWithUserState';
      case _i56.RatingDimension():
        return 'RatingDimension';
      case _i57.PoliticalStatus():
        return 'PoliticalStatus';
      case _i58.UserDevice():
        return 'UserDevice';
      case _i59.UserFollow():
        return 'UserFollow';
      case _i60.UserRecord():
        return 'UserRecord';
      case _i61.UsersList():
        return 'UsersList';
    }
    className = _i65.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Article') {
      return deserialize<_i2.Article>(data['data']);
    }
    if (dataClassName == 'MediaCleanupParams') {
      return deserialize<_i3.MediaCleanupParams>(data['data']);
    }
    if (dataClassName == 'AWSPlaces') {
      return deserialize<_i4.AWSPlaces>(data['data']);
    }
    if (dataClassName == 'LinkMetadata') {
      return deserialize<_i5.LinkMetadata>(data['data']);
    }
    if (dataClassName == 'LocationException') {
      return deserialize<_i6.LocationException>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i7.ServerSideException>(data['data']);
    }
    if (dataClassName == 'MediaAsset') {
      return deserialize<_i8.MediaAsset>(data['data']);
    }
    if (dataClassName == 'MediaKind') {
      return deserialize<_i9.MediaKind>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i10.AppNotification>(data['data']);
    }
    if (dataClassName == 'NotificationActionType') {
      return deserialize<_i11.NotificationActionType>(data['data']);
    }
    if (dataClassName == 'NotificationList') {
      return deserialize<_i12.NotificationList>(data['data']);
    }
    if (dataClassName == 'NotificationTargetType') {
      return deserialize<_i13.NotificationTargetType>(data['data']);
    }
    if (dataClassName == 'UserNotificationSettings') {
      return deserialize<_i14.UserNotificationSettings>(data['data']);
    }
    if (dataClassName == 'Poll') {
      return deserialize<_i15.Poll>(data['data']);
    }
    if (dataClassName == 'PollCounts') {
      return deserialize<_i16.PollCounts>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i17.PollOption>(data['data']);
    }
    if (dataClassName == 'PollOptionCount') {
      return deserialize<_i18.PollOptionCount>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i19.PollVote>(data['data']);
    }
    if (dataClassName == 'EngagementEvent') {
      return deserialize<_i20.EngagementEvent>(data['data']);
    }
    if (dataClassName == 'Hashtag') {
      return deserialize<_i21.Hashtag>(data['data']);
    }
    if (dataClassName == 'ImpressionLog') {
      return deserialize<_i22.ImpressionLog>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i23.Post>(data['data']);
    }
    if (dataClassName == 'PostBookmarks') {
      return deserialize<_i24.PostBookmarks>(data['data']);
    }
    if (dataClassName == 'PostCounts') {
      return deserialize<_i25.PostCounts>(data['data']);
    }
    if (dataClassName == 'PostImpression') {
      return deserialize<_i26.PostImpression>(data['data']);
    }
    if (dataClassName == 'PostLikes') {
      return deserialize<_i27.PostLikes>(data['data']);
    }
    if (dataClassName == 'PostList') {
      return deserialize<_i28.PostList>(data['data']);
    }
    if (dataClassName == 'PostNotInterested') {
      return deserialize<_i29.PostNotInterested>(data['data']);
    }
    if (dataClassName == 'PostSubscription') {
      return deserialize<_i30.PostSubscription>(data['data']);
    }
    if (dataClassName == 'PostQuotes') {
      return deserialize<_i31.PostQuotes>(data['data']);
    }
    if (dataClassName == 'PostReposts') {
      return deserialize<_i32.PostReposts>(data['data']);
    }
    if (dataClassName == 'PostType') {
      return deserialize<_i33.PostType>(data['data']);
    }
    if (dataClassName == 'PostWithUserState') {
      return deserialize<_i34.PostWithUserState>(data['data']);
    }
    if (dataClassName == 'PostsHashtags') {
      return deserialize<_i35.PostsHashtags>(data['data']);
    }
    if (dataClassName == 'FeedProjectList') {
      return deserialize<_i36.FeedProjectList>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i37.Project>(data['data']);
    }
    if (dataClassName == 'ProjectBookmarks') {
      return deserialize<_i38.ProjectBookmarks>(data['data']);
    }
    if (dataClassName == 'ProjectCounts') {
      return deserialize<_i39.ProjectCounts>(data['data']);
    }
    if (dataClassName == 'ProjectLikes') {
      return deserialize<_i40.ProjectLikes>(data['data']);
    }
    if (dataClassName == 'ProjectNotInterested') {
      return deserialize<_i41.ProjectNotInterested>(data['data']);
    }
    if (dataClassName == 'ProjectSubscription') {
      return deserialize<_i42.ProjectSubscription>(data['data']);
    }
    if (dataClassName == 'ProjectRating') {
      return deserialize<_i43.ProjectRating>(data['data']);
    }
    if (dataClassName == 'ProjectRatingCounts') {
      return deserialize<_i44.ProjectRatingCounts>(data['data']);
    }
    if (dataClassName == 'ProjectReview') {
      return deserialize<_i45.ProjectReview>(data['data']);
    }
    if (dataClassName == 'ProjectReviewCounts') {
      return deserialize<_i46.ProjectReviewCounts>(data['data']);
    }
    if (dataClassName == 'ProjectReviewList') {
      return deserialize<_i47.ProjectReviewList>(data['data']);
    }
    if (dataClassName == 'ProjectReviewReaction') {
      return deserialize<_i48.ProjectReviewReaction>(data['data']);
    }
    if (dataClassName == 'ProjectReviewWithUserState') {
      return deserialize<_i49.ProjectReviewWithUserState>(data['data']);
    }
    if (dataClassName == 'ProjectVetList') {
      return deserialize<_i50.ProjectVetList>(data['data']);
    }
    if (dataClassName == 'ProjectVetting') {
      return deserialize<_i51.ProjectVetting>(data['data']);
    }
    if (dataClassName == 'ProjectVettingReaction') {
      return deserialize<_i52.ProjectVettingReaction>(data['data']);
    }
    if (dataClassName == 'ProjectVettingWithUserState') {
      return deserialize<_i53.ProjectVettingWithUserState>(data['data']);
    }
    if (dataClassName == 'ProjectVettingsCount') {
      return deserialize<_i54.ProjectVettingsCount>(data['data']);
    }
    if (dataClassName == 'ProjectWithUserState') {
      return deserialize<_i55.ProjectWithUserState>(data['data']);
    }
    if (dataClassName == 'RatingDimension') {
      return deserialize<_i56.RatingDimension>(data['data']);
    }
    if (dataClassName == 'PoliticalStatus') {
      return deserialize<_i57.PoliticalStatus>(data['data']);
    }
    if (dataClassName == 'UserDevice') {
      return deserialize<_i58.UserDevice>(data['data']);
    }
    if (dataClassName == 'UserFollow') {
      return deserialize<_i59.UserFollow>(data['data']);
    }
    if (dataClassName == 'UserRecord') {
      return deserialize<_i60.UserRecord>(data['data']);
    }
    if (dataClassName == 'UsersList') {
      return deserialize<_i61.UsersList>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i65.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i65.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
