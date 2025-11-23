/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PostCounts
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PostCounts._({
    required this.postId,
    int? likesCount,
    int? bookmarksCount,
    int? commentCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  })  : likesCount = likesCount ?? 0,
        bookmarksCount = bookmarksCount ?? 0,
        commentCount = commentCount ?? 0,
        impressionsCount = impressionsCount ?? 0,
        lastImpressionAt = lastImpressionAt ?? DateTime.now();

  factory PostCounts({
    required int postId,
    int? likesCount,
    int? bookmarksCount,
    int? commentCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) = _PostCountsImpl;

  factory PostCounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostCounts(
      postId: jsonSerialization['postId'] as int,
      likesCount: jsonSerialization['likesCount'] as int?,
      bookmarksCount: jsonSerialization['bookmarksCount'] as int?,
      commentCount: jsonSerialization['commentCount'] as int?,
      impressionsCount: jsonSerialization['impressionsCount'] as int?,
      lastImpressionAt: jsonSerialization['lastImpressionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastImpressionAt']),
    );
  }

  int postId;

  int? likesCount;

  int? bookmarksCount;

  int? commentCount;

  int? impressionsCount;

  DateTime? lastImpressionAt;

  /// Returns a shallow copy of this [PostCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostCounts copyWith({
    int? postId,
    int? likesCount,
    int? bookmarksCount,
    int? commentCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      if (likesCount != null) 'likesCount': likesCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (commentCount != null) 'commentCount': commentCount,
      if (impressionsCount != null) 'impressionsCount': impressionsCount,
      if (lastImpressionAt != null)
        'lastImpressionAt': lastImpressionAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'postId': postId,
      if (likesCount != null) 'likesCount': likesCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (commentCount != null) 'commentCount': commentCount,
      if (impressionsCount != null) 'impressionsCount': impressionsCount,
      if (lastImpressionAt != null)
        'lastImpressionAt': lastImpressionAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCountsImpl extends PostCounts {
  _PostCountsImpl({
    required int postId,
    int? likesCount,
    int? bookmarksCount,
    int? commentCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) : super._(
          postId: postId,
          likesCount: likesCount,
          bookmarksCount: bookmarksCount,
          commentCount: commentCount,
          impressionsCount: impressionsCount,
          lastImpressionAt: lastImpressionAt,
        );

  /// Returns a shallow copy of this [PostCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostCounts copyWith({
    int? postId,
    Object? likesCount = _Undefined,
    Object? bookmarksCount = _Undefined,
    Object? commentCount = _Undefined,
    Object? impressionsCount = _Undefined,
    Object? lastImpressionAt = _Undefined,
  }) {
    return PostCounts(
      postId: postId ?? this.postId,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      bookmarksCount:
          bookmarksCount is int? ? bookmarksCount : this.bookmarksCount,
      commentCount: commentCount is int? ? commentCount : this.commentCount,
      impressionsCount:
          impressionsCount is int? ? impressionsCount : this.impressionsCount,
      lastImpressionAt: lastImpressionAt is DateTime?
          ? lastImpressionAt
          : this.lastImpressionAt,
    );
  }
}
