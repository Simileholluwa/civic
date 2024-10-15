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
import '../protocol.dart' as _i2;

abstract class PollHashtag implements _i1.SerializableModel {
  PollHashtag._({
    this.id,
    required this.tag,
    required this.usageCount,
    this.hashtags,
  });

  factory PollHashtag({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PollsHashtags>? hashtags,
  }) = _PollHashtagImpl;

  factory PollHashtag.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollHashtag(
      id: jsonSerialization['id'] as int?,
      tag: jsonSerialization['tag'] as String,
      usageCount: jsonSerialization['usageCount'] as int,
      hashtags: (jsonSerialization['hashtags'] as List?)
          ?.map((e) => _i2.PollsHashtags.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tag;

  int usageCount;

  List<_i2.PollsHashtags>? hashtags;

  PollHashtag copyWith({
    int? id,
    String? tag,
    int? usageCount,
    List<_i2.PollsHashtags>? hashtags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
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

class _PollHashtagImpl extends PollHashtag {
  _PollHashtagImpl({
    int? id,
    required String tag,
    required int usageCount,
    List<_i2.PollsHashtags>? hashtags,
  }) : super._(
          id: id,
          tag: tag,
          usageCount: usageCount,
          hashtags: hashtags,
        );

  @override
  PollHashtag copyWith({
    Object? id = _Undefined,
    String? tag,
    int? usageCount,
    Object? hashtags = _Undefined,
  }) {
    return PollHashtag(
      id: id is int? ? id : this.id,
      tag: tag ?? this.tag,
      usageCount: usageCount ?? this.usageCount,
      hashtags: hashtags is List<_i2.PollsHashtags>?
          ? hashtags
          : this.hashtags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
