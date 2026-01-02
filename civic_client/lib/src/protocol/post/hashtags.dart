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
import '../post/posts_hashtags.dart' as _i2;
import 'package:civic_client/src/protocol/protocol.dart' as _i3;

abstract class Hashtag implements _i1.SerializableModel {
  Hashtag._({
    this.id,
    required this.tag,
    required this.usageCount,
    this.hashtags,
  });

  factory Hashtag({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PostsHashtags>? hashtags,
  }) = _HashtagImpl;

  factory Hashtag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hashtag(
      id: jsonSerialization['id'] as int?,
      tag: jsonSerialization['tag'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      hashtags: jsonSerialization['hashtags'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.PostsHashtags>>(
              jsonSerialization['hashtags'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tag;

  int usageCount;

  List<_i2.PostsHashtags>? hashtags;

  /// Returns a shallow copy of this [Hashtag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Hashtag copyWith({
    int? id,
    String? tag,
    int? usageCount,
    List<_i2.PostsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Hashtag',
      if (id != null) 'id': id,
      'tag': tag,
      'usageCount': usageCount,
      if (hashtags != null)
        'hashtags': hashtags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HashtagImpl extends Hashtag {
  _HashtagImpl({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PostsHashtags>? hashtags,
  }) : super._(
         id: id,
         tag: tag,
         usageCount: usageCount,
         hashtags: hashtags,
       );

  /// Returns a shallow copy of this [Hashtag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Hashtag copyWith({
    Object? id = _Undefined,
    String? tag,
    int? usageCount,
    Object? hashtags = _Undefined,
  }) {
    return Hashtag(
      id: id is int? ? id : this.id,
      tag: tag ?? this.tag,
      usageCount: usageCount ?? this.usageCount,
      hashtags: hashtags is List<_i2.PostsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
