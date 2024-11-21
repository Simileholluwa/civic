/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'article/article.dart' as _i2;
import 'article/article_draft.dart' as _i3;
import 'article/article_list.dart' as _i4;
import 'general/aws_places.dart' as _i5;
import 'general/example.dart' as _i6;
import 'general/link_metadata.dart' as _i7;
import 'general/location_exception.dart' as _i8;
import 'poll/draft_poll.dart' as _i9;
import 'poll/poll.dart' as _i10;
import 'poll/poll_hashtag.dart' as _i11;
import 'poll/poll_hashtags.dart' as _i12;
import 'poll/poll_option.dart' as _i13;
import 'poll/poll_vote.dart' as _i14;
import 'post/draft_post.dart' as _i15;
import 'post/hashtags.dart' as _i16;
import 'post/post.dart' as _i17;
import 'post/post_exception.dart' as _i18;
import 'post/post_list.dart' as _i19;
import 'post/post_type_enums.dart' as _i20;
import 'post/posts_hashtags.dart' as _i21;
import 'project/project.dart' as _i22;
import 'project/project_list.dart' as _i23;
import 'project/project_status.dart' as _i24;
import 'user/political_status_enum.dart' as _i25;
import 'user/user_exception.dart' as _i26;
import 'user/user_nin_record.dart' as _i27;
import 'user/user_record.dart' as _i28;
import 'user/users_list.dart' as _i29;
import 'protocol.dart' as _i30;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i31;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i32;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i33;
export 'article/article.dart';
export 'article/article_draft.dart';
export 'article/article_list.dart';
export 'general/aws_places.dart';
export 'general/example.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
export 'poll/draft_poll.dart';
export 'poll/poll.dart';
export 'poll/poll_hashtag.dart';
export 'poll/poll_hashtags.dart';
export 'poll/poll_option.dart';
export 'poll/poll_vote.dart';
export 'post/draft_post.dart';
export 'post/hashtags.dart';
export 'post/post.dart';
export 'post/post_exception.dart';
export 'post/post_list.dart';
export 'post/post_type_enums.dart';
export 'post/posts_hashtags.dart';
export 'project/project.dart';
export 'project/project_list.dart';
export 'project/project_status.dart';
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
    if (t == _i9.DraftPoll) {
      return _i9.DraftPoll.fromJson(data) as T;
    }
    if (t == _i10.Poll) {
      return _i10.Poll.fromJson(data) as T;
    }
    if (t == _i11.PollHashtag) {
      return _i11.PollHashtag.fromJson(data) as T;
    }
    if (t == _i12.PollsHashtags) {
      return _i12.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i13.PollOption) {
      return _i13.PollOption.fromJson(data) as T;
    }
    if (t == _i14.PollVote) {
      return _i14.PollVote.fromJson(data) as T;
    }
    if (t == _i15.DraftPost) {
      return _i15.DraftPost.fromJson(data) as T;
    }
    if (t == _i16.Hashtag) {
      return _i16.Hashtag.fromJson(data) as T;
    }
    if (t == _i17.Post) {
      return _i17.Post.fromJson(data) as T;
    }
    if (t == _i18.PostException) {
      return _i18.PostException.fromJson(data) as T;
    }
    if (t == _i19.PostList) {
      return _i19.PostList.fromJson(data) as T;
    }
    if (t == _i20.PostType) {
      return _i20.PostType.fromJson(data) as T;
    }
    if (t == _i21.PostsHashtags) {
      return _i21.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i22.Project) {
      return _i22.Project.fromJson(data) as T;
    }
    if (t == _i23.ProjectList) {
      return _i23.ProjectList.fromJson(data) as T;
    }
    if (t == _i24.ProjectStatus) {
      return _i24.ProjectStatus.fromJson(data) as T;
    }
    if (t == _i25.PoliticalStatus) {
      return _i25.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i26.UserException) {
      return _i26.UserException.fromJson(data) as T;
    }
    if (t == _i27.UserNinRecord) {
      return _i27.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i28.UserRecord) {
      return _i28.UserRecord.fromJson(data) as T;
    }
    if (t == _i29.UsersList) {
      return _i29.UsersList.fromJson(data) as T;
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
    if (t == _i1.getType<_i9.DraftPoll?>()) {
      return (data != null ? _i9.DraftPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Poll?>()) {
      return (data != null ? _i10.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PollHashtag?>()) {
      return (data != null ? _i11.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PollsHashtags?>()) {
      return (data != null ? _i12.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PollOption?>()) {
      return (data != null ? _i13.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PollVote?>()) {
      return (data != null ? _i14.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.DraftPost?>()) {
      return (data != null ? _i15.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Hashtag?>()) {
      return (data != null ? _i16.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Post?>()) {
      return (data != null ? _i17.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PostException?>()) {
      return (data != null ? _i18.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PostList?>()) {
      return (data != null ? _i19.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PostType?>()) {
      return (data != null ? _i20.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PostsHashtags?>()) {
      return (data != null ? _i21.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Project?>()) {
      return (data != null ? _i22.Project.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ProjectList?>()) {
      return (data != null ? _i23.ProjectList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.ProjectStatus?>()) {
      return (data != null ? _i24.ProjectStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PoliticalStatus?>()) {
      return (data != null ? _i25.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserException?>()) {
      return (data != null ? _i26.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.UserNinRecord?>()) {
      return (data != null ? _i27.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.UserRecord?>()) {
      return (data != null ? _i28.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.UsersList?>()) {
      return (data != null ? _i29.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i30.Article>) {
      return (data as List).map((e) => deserialize<_i30.Article>(e)).toList()
          as dynamic;
    }
    if (t == List<_i30.UserRecord>) {
      return (data as List).map((e) => deserialize<_i30.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i30.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i30.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i30.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.UserRecord>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.AWSPlaces>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.UserRecord>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i30.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i30.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i30.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.UserRecord>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.AWSPlaces>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.UserRecord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.UserRecord>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i30.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i30.Post>) {
      return (data as List).map((e) => deserialize<_i30.Post>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i30.AWSPlaces>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i30.AWSPlaces>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i30.Project>) {
      return (data as List).map((e) => deserialize<_i30.Project>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i31.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i31.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i32.UserRecord>) {
      return (data as List).map((e) => deserialize<_i32.UserRecord>(e)).toList()
          as dynamic;
    }
    try {
      return _i33.Protocol().deserialize<T>(data, t);
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
    if (data is _i9.DraftPoll) {
      return 'DraftPoll';
    }
    if (data is _i10.Poll) {
      return 'Poll';
    }
    if (data is _i11.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i12.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i13.PollOption) {
      return 'PollOption';
    }
    if (data is _i14.PollVote) {
      return 'PollVote';
    }
    if (data is _i15.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i16.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i17.Post) {
      return 'Post';
    }
    if (data is _i18.PostException) {
      return 'PostException';
    }
    if (data is _i19.PostList) {
      return 'PostList';
    }
    if (data is _i20.PostType) {
      return 'PostType';
    }
    if (data is _i21.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i22.Project) {
      return 'Project';
    }
    if (data is _i23.ProjectList) {
      return 'ProjectList';
    }
    if (data is _i24.ProjectStatus) {
      return 'ProjectStatus';
    }
    if (data is _i25.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i26.UserException) {
      return 'UserException';
    }
    if (data is _i27.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i28.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i29.UsersList) {
      return 'UsersList';
    }
    className = _i33.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Article') {
      return deserialize<_i2.Article>(data['data']);
    }
    if (data['className'] == 'ArticleDraft') {
      return deserialize<_i3.ArticleDraft>(data['data']);
    }
    if (data['className'] == 'ArticleList') {
      return deserialize<_i4.ArticleList>(data['data']);
    }
    if (data['className'] == 'AWSPlaces') {
      return deserialize<_i5.AWSPlaces>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i6.Example>(data['data']);
    }
    if (data['className'] == 'LinkMetadata') {
      return deserialize<_i7.LinkMetadata>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i8.LocationException>(data['data']);
    }
    if (data['className'] == 'DraftPoll') {
      return deserialize<_i9.DraftPoll>(data['data']);
    }
    if (data['className'] == 'Poll') {
      return deserialize<_i10.Poll>(data['data']);
    }
    if (data['className'] == 'PollHashtag') {
      return deserialize<_i11.PollHashtag>(data['data']);
    }
    if (data['className'] == 'PollsHashtags') {
      return deserialize<_i12.PollsHashtags>(data['data']);
    }
    if (data['className'] == 'PollOption') {
      return deserialize<_i13.PollOption>(data['data']);
    }
    if (data['className'] == 'PollVote') {
      return deserialize<_i14.PollVote>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i15.DraftPost>(data['data']);
    }
    if (data['className'] == 'Hashtag') {
      return deserialize<_i16.Hashtag>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i17.Post>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i18.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i19.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i20.PostType>(data['data']);
    }
    if (data['className'] == 'PostsHashtags') {
      return deserialize<_i21.PostsHashtags>(data['data']);
    }
    if (data['className'] == 'Project') {
      return deserialize<_i22.Project>(data['data']);
    }
    if (data['className'] == 'ProjectList') {
      return deserialize<_i23.ProjectList>(data['data']);
    }
    if (data['className'] == 'ProjectStatus') {
      return deserialize<_i24.ProjectStatus>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i25.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i26.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i27.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i28.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i29.UsersList>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i33.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
