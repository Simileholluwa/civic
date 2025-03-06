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
import '../poll/poll.dart' as _i2;
import '../poll/poll_hashtag.dart' as _i3;

abstract class PollsHashtags implements _i1.SerializableModel {
  PollsHashtags._({
    this.id,
    required this.pollId,
    this.poll,
    required this.hashtagId,
    this.hashtag,
  });

  factory PollsHashtags({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int hashtagId,
    _i3.PollHashtag? hashtag,
  }) = _PollsHashtagsImpl;

  factory PollsHashtags.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollsHashtags(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      poll: jsonSerialization['poll'] == null
          ? null
          : _i2.Poll.fromJson(
              (jsonSerialization['poll'] as Map<String, dynamic>)),
      hashtagId: jsonSerialization['hashtagId'] as int,
      hashtag: jsonSerialization['hashtag'] == null
          ? null
          : _i3.PollHashtag.fromJson(
              (jsonSerialization['hashtag'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  _i2.Poll? poll;

  int hashtagId;

  _i3.PollHashtag? hashtag;

  /// Returns a shallow copy of this [PollsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollsHashtags copyWith({
    int? id,
    int? pollId,
    _i2.Poll? poll,
    int? hashtagId,
    _i3.PollHashtag? hashtag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pollId': pollId,
      if (poll != null) 'poll': poll?.toJson(),
      'hashtagId': hashtagId,
      if (hashtag != null) 'hashtag': hashtag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollsHashtagsImpl extends PollsHashtags {
  _PollsHashtagsImpl({
    int? id,
    required int pollId,
    _i2.Poll? poll,
    required int hashtagId,
    _i3.PollHashtag? hashtag,
  }) : super._(
          id: id,
          pollId: pollId,
          poll: poll,
          hashtagId: hashtagId,
          hashtag: hashtag,
        );

  /// Returns a shallow copy of this [PollsHashtags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollsHashtags copyWith({
    Object? id = _Undefined,
    int? pollId,
    Object? poll = _Undefined,
    int? hashtagId,
    Object? hashtag = _Undefined,
  }) {
    return PollsHashtags(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      poll: poll is _i2.Poll? ? poll : this.poll?.copyWith(),
      hashtagId: hashtagId ?? this.hashtagId,
      hashtag: hashtag is _i3.PollHashtag? ? hashtag : this.hashtag?.copyWith(),
    );
  }
}
