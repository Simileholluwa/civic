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
import 'article/article.dart' as _i2;
import 'article/article_draft.dart' as _i3;
import 'article/article_list.dart' as _i4;
import 'general/aws_places.dart' as _i5;
import 'general/example.dart' as _i6;
import 'general/link_metadata.dart' as _i7;
import 'general/location_exception.dart' as _i8;
import 'poll/poll.dart' as _i9;
import 'poll/poll_hashtag.dart' as _i10;
import 'poll/poll_hashtags.dart' as _i11;
import 'poll/poll_list.dart' as _i12;
import 'poll/poll_option.dart' as _i13;
import 'poll/poll_option_result.dart' as _i14;
import 'poll/poll_result.dart' as _i15;
import 'poll/poll_vote.dart' as _i16;
import 'post/hashtags.dart' as _i17;
import 'post/post.dart' as _i18;
import 'post/post_bookmarks.dart' as _i19;
import 'post/post_exception.dart' as _i20;
import 'post/post_likes.dart' as _i21;
import 'post/post_list.dart' as _i22;
import 'post/post_not_interested.dart' as _i23;
import 'post/post_type_enums.dart' as _i24;
import 'post/posts_hashtags.dart' as _i25;
import 'project/project.dart' as _i26;
import 'project/project_bookmarks.dart' as _i27;
import 'project/project_likes.dart' as _i28;
import 'project/project_list.dart' as _i29;
import 'project/project_not_interested.dart' as _i30;
import 'project/project_review.dart' as _i31;
import 'project/project_review_list.dart' as _i32;
import 'project/project_review_reaction.dart' as _i33;
import 'project/project_vet_list.dart' as _i34;
import 'project/project_vetting.dart' as _i35;
import 'project/project_vetting_reaction.dart' as _i36;
import 'user/political_status_enum.dart' as _i37;
import 'user/user_exception.dart' as _i38;
import 'user/user_nin_record.dart' as _i39;
import 'user/user_record.dart' as _i40;
import 'user/users_list.dart' as _i41;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i42;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i43;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i44;
export 'article/article.dart';
export 'article/article_draft.dart';
export 'article/article_list.dart';
export 'general/aws_places.dart';
export 'general/example.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'poll/poll.dart';
export 'poll/poll_hashtag.dart';
export 'poll/poll_hashtags.dart';
export 'poll/poll_list.dart';
export 'poll/poll_option.dart';
export 'poll/poll_option_result.dart';
export 'poll/poll_result.dart';
export 'poll/poll_vote.dart';
export 'post/hashtags.dart';
export 'post/post.dart';
export 'post/post_bookmarks.dart';
export 'post/post_exception.dart';
export 'post/post_likes.dart';
export 'post/post_list.dart';
export 'post/post_not_interested.dart';
export 'post/post_type_enums.dart';
export 'post/posts_hashtags.dart';
export 'project/project.dart';
export 'project/project_bookmarks.dart';
export 'project/project_likes.dart';
export 'project/project_list.dart';
export 'project/project_not_interested.dart';
export 'project/project_review.dart';
export 'project/project_review_list.dart';
export 'project/project_review_reaction.dart';
export 'project/project_vet_list.dart';
export 'project/project_vetting.dart';
export 'project/project_vetting_reaction.dart';
export 'user/political_status_enum.dart';
export 'user/user_exception.dart';
export 'user/user_nin_record.dart';
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
    if (t == _i2.Article) {
      return _i2.Article.fromJson(data) as T;
    }
    if (t == _i3.ArticleDraft) {
      return _i3.ArticleDraft.fromJson(data) as T;
    }
    if (t == _i4.ArticleList) {
      return _i4.ArticleList.fromJson(data) as T;
    }
    if (t == _i5.AWSPlaces) {
      return _i5.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i6.Example) {
      return _i6.Example.fromJson(data) as T;
    }
    if (t == _i7.LinkMetadata) {
      return _i7.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i8.LocationException) {
      return _i8.LocationException.fromJson(data) as T;
    }
    if (t == _i9.Poll) {
      return _i9.Poll.fromJson(data) as T;
    }
    if (t == _i10.PollHashtag) {
      return _i10.PollHashtag.fromJson(data) as T;
    }
    if (t == _i11.PollsHashtags) {
      return _i11.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i12.PollList) {
      return _i12.PollList.fromJson(data) as T;
    }
    if (t == _i13.PollOption) {
      return _i13.PollOption.fromJson(data) as T;
    }
    if (t == _i14.PollOptionResult) {
      return _i14.PollOptionResult.fromJson(data) as T;
    }
    if (t == _i15.PollResult) {
      return _i15.PollResult.fromJson(data) as T;
    }
    if (t == _i16.PollVote) {
      return _i16.PollVote.fromJson(data) as T;
    }
    if (t == _i17.Hashtag) {
      return _i17.Hashtag.fromJson(data) as T;
    }
    if (t == _i18.Post) {
      return _i18.Post.fromJson(data) as T;
    }
    if (t == _i19.PostBookmarks) {
      return _i19.PostBookmarks.fromJson(data) as T;
    }
    if (t == _i20.PostException) {
      return _i20.PostException.fromJson(data) as T;
    }
    if (t == _i21.PostLikes) {
      return _i21.PostLikes.fromJson(data) as T;
    }
    if (t == _i22.PostList) {
      return _i22.PostList.fromJson(data) as T;
    }
    if (t == _i23.PostNotInterested) {
      return _i23.PostNotInterested.fromJson(data) as T;
    }
    if (t == _i24.PostType) {
      return _i24.PostType.fromJson(data) as T;
    }
    if (t == _i25.PostsHashtags) {
      return _i25.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i26.Project) {
      return _i26.Project.fromJson(data) as T;
    }
    if (t == _i27.ProjectBookmarks) {
      return _i27.ProjectBookmarks.fromJson(data) as T;
    }
    if (t == _i28.ProjectLikes) {
      return _i28.ProjectLikes.fromJson(data) as T;
    }
    if (t == _i29.ProjectList) {
      return _i29.ProjectList.fromJson(data) as T;
    }
    if (t == _i30.ProjectNotInterested) {
      return _i30.ProjectNotInterested.fromJson(data) as T;
    }
    if (t == _i31.ProjectReview) {
      return _i31.ProjectReview.fromJson(data) as T;
    }
    if (t == _i32.ProjectReviewList) {
      return _i32.ProjectReviewList.fromJson(data) as T;
    }
    if (t == _i33.ProjectReviewReaction) {
      return _i33.ProjectReviewReaction.fromJson(data) as T;
    }
    if (t == _i34.ProjectVetList) {
      return _i34.ProjectVetList.fromJson(data) as T;
    }
    if (t == _i35.ProjectVetting) {
      return _i35.ProjectVetting.fromJson(data) as T;
    }
    if (t == _i36.ProjectVettingReaction) {
      return _i36.ProjectVettingReaction.fromJson(data) as T;
    }
    if (t == _i37.PoliticalStatus) {
      return _i37.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i38.UserException) {
      return _i38.UserException.fromJson(data) as T;
    }
    if (t == _i39.UserNinRecord) {
      return _i39.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i40.UserRecord) {
      return _i40.UserRecord.fromJson(data) as T;
    }
    if (t == _i41.UsersList) {
      return _i41.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Article?>()) {
      return (data != null ? _i2.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ArticleDraft?>()) {
      return (data != null ? _i3.ArticleDraft.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ArticleList?>()) {
      return (data != null ? _i4.ArticleList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AWSPlaces?>()) {
      return (data != null ? _i5.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Example?>()) {
      return (data != null ? _i6.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LinkMetadata?>()) {
      return (data != null ? _i7.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LocationException?>()) {
      return (data != null ? _i8.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Poll?>()) {
      return (data != null ? _i9.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PollHashtag?>()) {
      return (data != null ? _i10.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PollsHashtags?>()) {
      return (data != null ? _i11.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PollList?>()) {
      return (data != null ? _i12.PollList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PollOption?>()) {
      return (data != null ? _i13.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PollOptionResult?>()) {
      return (data != null ? _i14.PollOptionResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PollResult?>()) {
      return (data != null ? _i15.PollResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PollVote?>()) {
      return (data != null ? _i16.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Hashtag?>()) {
      return (data != null ? _i17.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Post?>()) {
      return (data != null ? _i18.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PostBookmarks?>()) {
      return (data != null ? _i19.PostBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostException?>()) {
      return (data != null ? _i20.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PostLikes?>()) {
      return (data != null ? _i21.PostLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PostList?>()) {
      return (data != null ? _i22.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.PostNotInterested?>()) {
      return (data != null ? _i23.PostNotInterested.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PostType?>()) {
      return (data != null ? _i24.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PostsHashtags?>()) {
      return (data != null ? _i25.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Project?>()) {
      return (data != null ? _i26.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.ProjectBookmarks?>()) {
      return (data != null ? _i27.ProjectBookmarks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.ProjectLikes?>()) {
      return (data != null ? _i28.ProjectLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ProjectList?>()) {
      return (data != null ? _i29.ProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.ProjectNotInterested?>()) {
      return (data != null ? _i30.ProjectNotInterested.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.ProjectReview?>()) {
      return (data != null ? _i31.ProjectReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ProjectReviewList?>()) {
      return (data != null ? _i32.ProjectReviewList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.ProjectReviewReaction?>()) {
      return (data != null ? _i33.ProjectReviewReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.ProjectVetList?>()) {
      return (data != null ? _i34.ProjectVetList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ProjectVetting?>()) {
      return (data != null ? _i35.ProjectVetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.ProjectVettingReaction?>()) {
      return (data != null ? _i36.ProjectVettingReaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.PoliticalStatus?>()) {
      return (data != null ? _i37.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.UserException?>()) {
      return (data != null ? _i38.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.UserNinRecord?>()) {
      return (data != null ? _i39.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.UserRecord?>()) {
      return (data != null ? _i40.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.UsersList?>()) {
      return (data != null ? _i41.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i2.Article>) {
      return (data as List).map((e) => deserialize<_i2.Article>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i40.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i40.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i40.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i40.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i13.PollOption>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.PollOption>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i11.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.PollsHashtags>(e))
              .toList()
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
    if (t == _i1.getType<List<_i11.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.PollsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i9.Poll>) {
      return (data as List).map((e) => deserialize<_i9.Poll>(e)).toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i14.PollOptionResult>) {
      return (data as List)
          .map((e) => deserialize<_i14.PollOptionResult>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i25.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.PostsHashtags>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i40.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i40.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.AWSPlaces>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i40.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i40.UserRecord>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i25.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.PostsHashtags>(e))
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
    if (t == List<_i18.Post>) {
      return (data as List).map((e) => deserialize<_i18.Post>(e)).toList() as T;
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
    if (t == _i1.getType<List<_i5.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.AWSPlaces>(e)).toList()
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
    if (t == List<_i26.Project>) {
      return (data as List).map((e) => deserialize<_i26.Project>(e)).toList()
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
    if (t == List<_i31.ProjectReview>) {
      return (data as List)
          .map((e) => deserialize<_i31.ProjectReview>(e))
          .toList() as T;
    }
    if (t == List<_i35.ProjectVetting>) {
      return (data as List)
          .map((e) => deserialize<_i35.ProjectVetting>(e))
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
    if (t == List<_i40.UserRecord>) {
      return (data as List).map((e) => deserialize<_i40.UserRecord>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i42.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i42.AWSPlaces>(e)).toList()
          as T;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList() as T;
    }
    if (t == List<_i43.UserRecord>) {
      return (data as List).map((e) => deserialize<_i43.UserRecord>(e)).toList()
          as T;
    }
    try {
      return _i44.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Article) {
      return 'Article';
    }
    if (data is _i3.ArticleDraft) {
      return 'ArticleDraft';
    }
    if (data is _i4.ArticleList) {
      return 'ArticleList';
    }
    if (data is _i5.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i6.Example) {
      return 'Example';
    }
    if (data is _i7.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i8.LocationException) {
      return 'LocationException';
    }
    if (data is _i9.Poll) {
      return 'Poll';
    }
    if (data is _i10.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i11.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i12.PollList) {
      return 'PollList';
    }
    if (data is _i13.PollOption) {
      return 'PollOption';
    }
    if (data is _i14.PollOptionResult) {
      return 'PollOptionResult';
    }
    if (data is _i15.PollResult) {
      return 'PollResult';
    }
    if (data is _i16.PollVote) {
      return 'PollVote';
    }
    if (data is _i17.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i18.Post) {
      return 'Post';
    }
    if (data is _i19.PostBookmarks) {
      return 'PostBookmarks';
    }
    if (data is _i20.PostException) {
      return 'PostException';
    }
    if (data is _i21.PostLikes) {
      return 'PostLikes';
    }
    if (data is _i22.PostList) {
      return 'PostList';
    }
    if (data is _i23.PostNotInterested) {
      return 'PostNotInterested';
    }
    if (data is _i24.PostType) {
      return 'PostType';
    }
    if (data is _i25.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i26.Project) {
      return 'Project';
    }
    if (data is _i27.ProjectBookmarks) {
      return 'ProjectBookmarks';
    }
    if (data is _i28.ProjectLikes) {
      return 'ProjectLikes';
    }
    if (data is _i29.ProjectList) {
      return 'ProjectList';
    }
    if (data is _i30.ProjectNotInterested) {
      return 'ProjectNotInterested';
    }
    if (data is _i31.ProjectReview) {
      return 'ProjectReview';
    }
    if (data is _i32.ProjectReviewList) {
      return 'ProjectReviewList';
    }
    if (data is _i33.ProjectReviewReaction) {
      return 'ProjectReviewReaction';
    }
    if (data is _i34.ProjectVetList) {
      return 'ProjectVetList';
    }
    if (data is _i35.ProjectVetting) {
      return 'ProjectVetting';
    }
    if (data is _i36.ProjectVettingReaction) {
      return 'ProjectVettingReaction';
    }
    if (data is _i37.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i38.UserException) {
      return 'UserException';
    }
    if (data is _i39.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i40.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i41.UsersList) {
      return 'UsersList';
    }
    className = _i44.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'ArticleDraft') {
      return deserialize<_i3.ArticleDraft>(data['data']);
    }
    if (dataClassName == 'ArticleList') {
      return deserialize<_i4.ArticleList>(data['data']);
    }
    if (dataClassName == 'AWSPlaces') {
      return deserialize<_i5.AWSPlaces>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i6.Example>(data['data']);
    }
    if (dataClassName == 'LinkMetadata') {
      return deserialize<_i7.LinkMetadata>(data['data']);
    }
    if (dataClassName == 'LocationException') {
      return deserialize<_i8.LocationException>(data['data']);
    }
    if (dataClassName == 'Poll') {
      return deserialize<_i9.Poll>(data['data']);
    }
    if (dataClassName == 'PollHashtag') {
      return deserialize<_i10.PollHashtag>(data['data']);
    }
    if (dataClassName == 'PollsHashtags') {
      return deserialize<_i11.PollsHashtags>(data['data']);
    }
    if (dataClassName == 'PollList') {
      return deserialize<_i12.PollList>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i13.PollOption>(data['data']);
    }
    if (dataClassName == 'PollOptionResult') {
      return deserialize<_i14.PollOptionResult>(data['data']);
    }
    if (dataClassName == 'PollResult') {
      return deserialize<_i15.PollResult>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i16.PollVote>(data['data']);
    }
    if (dataClassName == 'Hashtag') {
      return deserialize<_i17.Hashtag>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i18.Post>(data['data']);
    }
    if (dataClassName == 'PostBookmarks') {
      return deserialize<_i19.PostBookmarks>(data['data']);
    }
    if (dataClassName == 'PostException') {
      return deserialize<_i20.PostException>(data['data']);
    }
    if (dataClassName == 'PostLikes') {
      return deserialize<_i21.PostLikes>(data['data']);
    }
    if (dataClassName == 'PostList') {
      return deserialize<_i22.PostList>(data['data']);
    }
    if (dataClassName == 'PostNotInterested') {
      return deserialize<_i23.PostNotInterested>(data['data']);
    }
    if (dataClassName == 'PostType') {
      return deserialize<_i24.PostType>(data['data']);
    }
    if (dataClassName == 'PostsHashtags') {
      return deserialize<_i25.PostsHashtags>(data['data']);
    }
    if (dataClassName == 'Project') {
      return deserialize<_i26.Project>(data['data']);
    }
    if (dataClassName == 'ProjectBookmarks') {
      return deserialize<_i27.ProjectBookmarks>(data['data']);
    }
    if (dataClassName == 'ProjectLikes') {
      return deserialize<_i28.ProjectLikes>(data['data']);
    }
    if (dataClassName == 'ProjectList') {
      return deserialize<_i29.ProjectList>(data['data']);
    }
    if (dataClassName == 'ProjectNotInterested') {
      return deserialize<_i30.ProjectNotInterested>(data['data']);
    }
    if (dataClassName == 'ProjectReview') {
      return deserialize<_i31.ProjectReview>(data['data']);
    }
    if (dataClassName == 'ProjectReviewList') {
      return deserialize<_i32.ProjectReviewList>(data['data']);
    }
    if (dataClassName == 'ProjectReviewReaction') {
      return deserialize<_i33.ProjectReviewReaction>(data['data']);
    }
    if (dataClassName == 'ProjectVetList') {
      return deserialize<_i34.ProjectVetList>(data['data']);
    }
    if (dataClassName == 'ProjectVetting') {
      return deserialize<_i35.ProjectVetting>(data['data']);
    }
    if (dataClassName == 'ProjectVettingReaction') {
      return deserialize<_i36.ProjectVettingReaction>(data['data']);
    }
    if (dataClassName == 'PoliticalStatus') {
      return deserialize<_i37.PoliticalStatus>(data['data']);
    }
    if (dataClassName == 'UserException') {
      return deserialize<_i38.UserException>(data['data']);
    }
    if (dataClassName == 'UserNinRecord') {
      return deserialize<_i39.UserNinRecord>(data['data']);
    }
    if (dataClassName == 'UserRecord') {
      return deserialize<_i40.UserRecord>(data['data']);
    }
    if (dataClassName == 'UsersList') {
      return deserialize<_i41.UsersList>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i44.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
