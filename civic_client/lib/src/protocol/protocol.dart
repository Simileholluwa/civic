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
import 'general/aws_places.dart' as _i2;
import 'general/example.dart' as _i3;
import 'general/link_metadata.dart' as _i4;
import 'general/location_exception.dart' as _i5;
import 'poll/draft_poll.dart' as _i6;
import 'poll/poll.dart' as _i7;
import 'poll/poll_hashtag.dart' as _i8;
import 'poll/poll_hashtags.dart' as _i9;
import 'poll/poll_option.dart' as _i10;
import 'poll/poll_vote.dart' as _i11;
import 'post/draft_post.dart' as _i12;
import 'post/hashtags.dart' as _i13;
import 'post/post.dart' as _i14;
import 'post/post_exception.dart' as _i15;
import 'post/post_list.dart' as _i16;
import 'post/post_type_enums.dart' as _i17;
import 'post/posts_hashtags.dart' as _i18;
import 'user/political_status_enum.dart' as _i19;
import 'user/user_exception.dart' as _i20;
import 'user/user_nin_record.dart' as _i21;
import 'user/user_record.dart' as _i22;
import 'user/users_list.dart' as _i23;
import 'protocol.dart' as _i24;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i25;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i26;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i27;
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
    if (t == _i2.AWSPlaces) {
      return _i2.AWSPlaces.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.LinkMetadata) {
      return _i4.LinkMetadata.fromJson(data) as T;
    }
    if (t == _i5.LocationException) {
      return _i5.LocationException.fromJson(data) as T;
    }
    if (t == _i6.DraftPoll) {
      return _i6.DraftPoll.fromJson(data) as T;
    }
    if (t == _i7.Poll) {
      return _i7.Poll.fromJson(data) as T;
    }
    if (t == _i8.PollHashtag) {
      return _i8.PollHashtag.fromJson(data) as T;
    }
    if (t == _i9.PollsHashtags) {
      return _i9.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i10.PollOption) {
      return _i10.PollOption.fromJson(data) as T;
    }
    if (t == _i11.PollVote) {
      return _i11.PollVote.fromJson(data) as T;
    }
    if (t == _i12.DraftPost) {
      return _i12.DraftPost.fromJson(data) as T;
    }
    if (t == _i13.Hashtag) {
      return _i13.Hashtag.fromJson(data) as T;
    }
    if (t == _i14.Post) {
      return _i14.Post.fromJson(data) as T;
    }
    if (t == _i15.PostException) {
      return _i15.PostException.fromJson(data) as T;
    }
    if (t == _i16.PostList) {
      return _i16.PostList.fromJson(data) as T;
    }
    if (t == _i17.PostType) {
      return _i17.PostType.fromJson(data) as T;
    }
    if (t == _i18.PostsHashtags) {
      return _i18.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i19.PoliticalStatus) {
      return _i19.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i20.UserException) {
      return _i20.UserException.fromJson(data) as T;
    }
    if (t == _i21.UserNinRecord) {
      return _i21.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i22.UserRecord) {
      return _i22.UserRecord.fromJson(data) as T;
    }
    if (t == _i23.UsersList) {
      return _i23.UsersList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AWSPlaces?>()) {
      return (data != null ? _i2.AWSPlaces.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LinkMetadata?>()) {
      return (data != null ? _i4.LinkMetadata.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LocationException?>()) {
      return (data != null ? _i5.LocationException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DraftPoll?>()) {
      return (data != null ? _i6.DraftPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Poll?>()) {
      return (data != null ? _i7.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PollHashtag?>()) {
      return (data != null ? _i8.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PollsHashtags?>()) {
      return (data != null ? _i9.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PollOption?>()) {
      return (data != null ? _i10.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PollVote?>()) {
      return (data != null ? _i11.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DraftPost?>()) {
      return (data != null ? _i12.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Hashtag?>()) {
      return (data != null ? _i13.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Post?>()) {
      return (data != null ? _i14.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PostException?>()) {
      return (data != null ? _i15.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PostList?>()) {
      return (data != null ? _i16.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PostType?>()) {
      return (data != null ? _i17.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PostsHashtags?>()) {
      return (data != null ? _i18.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PoliticalStatus?>()) {
      return (data != null ? _i19.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UserException?>()) {
      return (data != null ? _i20.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.UserNinRecord?>()) {
      return (data != null ? _i21.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserRecord?>()) {
      return (data != null ? _i22.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UsersList?>()) {
      return (data != null ? _i23.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i24.UserRecord>) {
      return (data as List).map((e) => deserialize<_i24.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i24.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i24.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i24.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i24.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i24.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i24.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i24.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i24.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i24.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i24.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i24.Post>) {
      return (data as List).map((e) => deserialize<_i24.Post>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i25.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i25.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i26.UserRecord>) {
      return (data as List).map((e) => deserialize<_i26.UserRecord>(e)).toList()
          as dynamic;
    }
    try {
      return _i27.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.AWSPlaces) {
      return 'AWSPlaces';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.LinkMetadata) {
      return 'LinkMetadata';
    }
    if (data is _i5.LocationException) {
      return 'LocationException';
    }
    if (data is _i6.DraftPoll) {
      return 'DraftPoll';
    }
    if (data is _i7.Poll) {
      return 'Poll';
    }
    if (data is _i8.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i9.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i10.PollOption) {
      return 'PollOption';
    }
    if (data is _i11.PollVote) {
      return 'PollVote';
    }
    if (data is _i12.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i13.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i14.Post) {
      return 'Post';
    }
    if (data is _i15.PostException) {
      return 'PostException';
    }
    if (data is _i16.PostList) {
      return 'PostList';
    }
    if (data is _i17.PostType) {
      return 'PostType';
    }
    if (data is _i18.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i19.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i20.UserException) {
      return 'UserException';
    }
    if (data is _i21.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i22.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i23.UsersList) {
      return 'UsersList';
    }
    className = _i27.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AWSPlaces') {
      return deserialize<_i2.AWSPlaces>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'LinkMetadata') {
      return deserialize<_i4.LinkMetadata>(data['data']);
    }
    if (data['className'] == 'LocationException') {
      return deserialize<_i5.LocationException>(data['data']);
    }
    if (data['className'] == 'DraftPoll') {
      return deserialize<_i6.DraftPoll>(data['data']);
    }
    if (data['className'] == 'Poll') {
      return deserialize<_i7.Poll>(data['data']);
    }
    if (data['className'] == 'PollHashtag') {
      return deserialize<_i8.PollHashtag>(data['data']);
    }
    if (data['className'] == 'PollsHashtags') {
      return deserialize<_i9.PollsHashtags>(data['data']);
    }
    if (data['className'] == 'PollOption') {
      return deserialize<_i10.PollOption>(data['data']);
    }
    if (data['className'] == 'PollVote') {
      return deserialize<_i11.PollVote>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i12.DraftPost>(data['data']);
    }
    if (data['className'] == 'Hashtag') {
      return deserialize<_i13.Hashtag>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i14.Post>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i15.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i16.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i17.PostType>(data['data']);
    }
    if (data['className'] == 'PostsHashtags') {
      return deserialize<_i18.PostsHashtags>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i19.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i20.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i21.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i22.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i23.UsersList>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i27.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
