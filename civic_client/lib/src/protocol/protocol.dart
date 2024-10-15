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
import 'poll/poll.dart' as _i6;
import 'poll/poll_hashtag.dart' as _i7;
import 'poll/poll_hashtags.dart' as _i8;
import 'poll/poll_option.dart' as _i9;
import 'poll/poll_vote.dart' as _i10;
import 'post/draft_post.dart' as _i11;
import 'post/hashtags.dart' as _i12;
import 'post/post.dart' as _i13;
import 'post/post_exception.dart' as _i14;
import 'post/post_list.dart' as _i15;
import 'post/post_type_enums.dart' as _i16;
import 'post/posts_hashtags.dart' as _i17;
import 'user/political_status_enum.dart' as _i18;
import 'user/user_exception.dart' as _i19;
import 'user/user_nin_record.dart' as _i20;
import 'user/user_record.dart' as _i21;
import 'user/users_list.dart' as _i22;
import 'protocol.dart' as _i23;
import 'package:civic_client/src/protocol/general/aws_places.dart' as _i24;
import 'package:civic_client/src/protocol/user/user_record.dart' as _i25;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i26;
export 'general/aws_places.dart';
export 'general/example.dart';
export 'general/link_metadata.dart';
export 'general/location_exception.dart';
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
    if (t == _i6.Poll) {
      return _i6.Poll.fromJson(data) as T;
    }
    if (t == _i7.PollHashtag) {
      return _i7.PollHashtag.fromJson(data) as T;
    }
    if (t == _i8.PollsHashtags) {
      return _i8.PollsHashtags.fromJson(data) as T;
    }
    if (t == _i9.PollOption) {
      return _i9.PollOption.fromJson(data) as T;
    }
    if (t == _i10.PollVote) {
      return _i10.PollVote.fromJson(data) as T;
    }
    if (t == _i11.DraftPost) {
      return _i11.DraftPost.fromJson(data) as T;
    }
    if (t == _i12.Hashtag) {
      return _i12.Hashtag.fromJson(data) as T;
    }
    if (t == _i13.Post) {
      return _i13.Post.fromJson(data) as T;
    }
    if (t == _i14.PostException) {
      return _i14.PostException.fromJson(data) as T;
    }
    if (t == _i15.PostList) {
      return _i15.PostList.fromJson(data) as T;
    }
    if (t == _i16.PostType) {
      return _i16.PostType.fromJson(data) as T;
    }
    if (t == _i17.PostsHashtags) {
      return _i17.PostsHashtags.fromJson(data) as T;
    }
    if (t == _i18.PoliticalStatus) {
      return _i18.PoliticalStatus.fromJson(data) as T;
    }
    if (t == _i19.UserException) {
      return _i19.UserException.fromJson(data) as T;
    }
    if (t == _i20.UserNinRecord) {
      return _i20.UserNinRecord.fromJson(data) as T;
    }
    if (t == _i21.UserRecord) {
      return _i21.UserRecord.fromJson(data) as T;
    }
    if (t == _i22.UsersList) {
      return _i22.UsersList.fromJson(data) as T;
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
    if (t == _i1.getType<_i6.Poll?>()) {
      return (data != null ? _i6.Poll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PollHashtag?>()) {
      return (data != null ? _i7.PollHashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PollsHashtags?>()) {
      return (data != null ? _i8.PollsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PollOption?>()) {
      return (data != null ? _i9.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PollVote?>()) {
      return (data != null ? _i10.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DraftPost?>()) {
      return (data != null ? _i11.DraftPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Hashtag?>()) {
      return (data != null ? _i12.Hashtag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Post?>()) {
      return (data != null ? _i13.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PostException?>()) {
      return (data != null ? _i14.PostException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PostList?>()) {
      return (data != null ? _i15.PostList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PostType?>()) {
      return (data != null ? _i16.PostType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PostsHashtags?>()) {
      return (data != null ? _i17.PostsHashtags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PoliticalStatus?>()) {
      return (data != null ? _i18.PoliticalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.UserException?>()) {
      return (data != null ? _i19.UserException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UserNinRecord?>()) {
      return (data != null ? _i20.UserNinRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.UserRecord?>()) {
      return (data != null ? _i21.UserRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UsersList?>()) {
      return (data != null ? _i22.UsersList.fromJson(data) : null) as T;
    }
    if (t == List<_i23.UserRecord>) {
      return (data as List).map((e) => deserialize<_i23.UserRecord>(e)).toList()
          as dynamic;
    }
    if (t == List<_i23.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i23.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i23.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.PollsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PollsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.PostsHashtags>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.PostsHashtags>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i23.Post>) {
      return (data as List).map((e) => deserialize<_i23.Post>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i24.AWSPlaces>) {
      return (data as List).map((e) => deserialize<_i24.AWSPlaces>(e)).toList()
          as dynamic;
    }
    if (t == List<double>) {
      return (data as List).map((e) => deserialize<double>(e)).toList()
          as dynamic;
    }
    if (t == List<_i25.UserRecord>) {
      return (data as List).map((e) => deserialize<_i25.UserRecord>(e)).toList()
          as dynamic;
    }
    try {
      return _i26.Protocol().deserialize<T>(data, t);
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
    if (data is _i6.Poll) {
      return 'Poll';
    }
    if (data is _i7.PollHashtag) {
      return 'PollHashtag';
    }
    if (data is _i8.PollsHashtags) {
      return 'PollsHashtags';
    }
    if (data is _i9.PollOption) {
      return 'PollOption';
    }
    if (data is _i10.PollVote) {
      return 'PollVote';
    }
    if (data is _i11.DraftPost) {
      return 'DraftPost';
    }
    if (data is _i12.Hashtag) {
      return 'Hashtag';
    }
    if (data is _i13.Post) {
      return 'Post';
    }
    if (data is _i14.PostException) {
      return 'PostException';
    }
    if (data is _i15.PostList) {
      return 'PostList';
    }
    if (data is _i16.PostType) {
      return 'PostType';
    }
    if (data is _i17.PostsHashtags) {
      return 'PostsHashtags';
    }
    if (data is _i18.PoliticalStatus) {
      return 'PoliticalStatus';
    }
    if (data is _i19.UserException) {
      return 'UserException';
    }
    if (data is _i20.UserNinRecord) {
      return 'UserNinRecord';
    }
    if (data is _i21.UserRecord) {
      return 'UserRecord';
    }
    if (data is _i22.UsersList) {
      return 'UsersList';
    }
    className = _i26.Protocol().getClassNameForObject(data);
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
    if (data['className'] == 'Poll') {
      return deserialize<_i6.Poll>(data['data']);
    }
    if (data['className'] == 'PollHashtag') {
      return deserialize<_i7.PollHashtag>(data['data']);
    }
    if (data['className'] == 'PollsHashtags') {
      return deserialize<_i8.PollsHashtags>(data['data']);
    }
    if (data['className'] == 'PollOption') {
      return deserialize<_i9.PollOption>(data['data']);
    }
    if (data['className'] == 'PollVote') {
      return deserialize<_i10.PollVote>(data['data']);
    }
    if (data['className'] == 'DraftPost') {
      return deserialize<_i11.DraftPost>(data['data']);
    }
    if (data['className'] == 'Hashtag') {
      return deserialize<_i12.Hashtag>(data['data']);
    }
    if (data['className'] == 'Post') {
      return deserialize<_i13.Post>(data['data']);
    }
    if (data['className'] == 'PostException') {
      return deserialize<_i14.PostException>(data['data']);
    }
    if (data['className'] == 'PostList') {
      return deserialize<_i15.PostList>(data['data']);
    }
    if (data['className'] == 'PostType') {
      return deserialize<_i16.PostType>(data['data']);
    }
    if (data['className'] == 'PostsHashtags') {
      return deserialize<_i17.PostsHashtags>(data['data']);
    }
    if (data['className'] == 'PoliticalStatus') {
      return deserialize<_i18.PoliticalStatus>(data['data']);
    }
    if (data['className'] == 'UserException') {
      return deserialize<_i19.UserException>(data['data']);
    }
    if (data['className'] == 'UserNinRecord') {
      return deserialize<_i20.UserNinRecord>(data['data']);
    }
    if (data['className'] == 'UserRecord') {
      return deserialize<_i21.UserRecord>(data['data']);
    }
    if (data['className'] == 'UsersList') {
      return deserialize<_i22.UsersList>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i26.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
