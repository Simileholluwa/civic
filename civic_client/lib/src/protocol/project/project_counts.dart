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

abstract class ProjectCounts implements _i1.SerializableModel {
  ProjectCounts._({
    required this.projectId,
    int? likesCount,
    int? quotesCount,
    int? bookmarksCount,
    int? reviewsCount,
    int? vettingsCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) : likesCount = likesCount ?? 0,
       quotesCount = quotesCount ?? 0,
       bookmarksCount = bookmarksCount ?? 0,
       reviewsCount = reviewsCount ?? 0,
       vettingsCount = vettingsCount ?? 0,
       impressionsCount = impressionsCount ?? 0,
       lastImpressionAt = lastImpressionAt ?? DateTime.now();

  factory ProjectCounts({
    required int projectId,
    int? likesCount,
    int? quotesCount,
    int? bookmarksCount,
    int? reviewsCount,
    int? vettingsCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) = _ProjectCountsImpl;

  factory ProjectCounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProjectCounts(
      projectId: jsonSerialization['projectId'] as int,
      likesCount: jsonSerialization['likesCount'] as int?,
      quotesCount: jsonSerialization['quotesCount'] as int?,
      bookmarksCount: jsonSerialization['bookmarksCount'] as int?,
      reviewsCount: jsonSerialization['reviewsCount'] as int?,
      vettingsCount: jsonSerialization['vettingsCount'] as int?,
      impressionsCount: jsonSerialization['impressionsCount'] as int?,
      lastImpressionAt: jsonSerialization['lastImpressionAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastImpressionAt'],
            ),
    );
  }

  int projectId;

  int? likesCount;

  int? quotesCount;

  int? bookmarksCount;

  int? reviewsCount;

  int? vettingsCount;

  int? impressionsCount;

  DateTime? lastImpressionAt;

  /// Returns a shallow copy of this [ProjectCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProjectCounts copyWith({
    int? projectId,
    int? likesCount,
    int? quotesCount,
    int? bookmarksCount,
    int? reviewsCount,
    int? vettingsCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProjectCounts',
      'projectId': projectId,
      if (likesCount != null) 'likesCount': likesCount,
      if (quotesCount != null) 'quotesCount': quotesCount,
      if (bookmarksCount != null) 'bookmarksCount': bookmarksCount,
      if (reviewsCount != null) 'reviewsCount': reviewsCount,
      if (vettingsCount != null) 'vettingsCount': vettingsCount,
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

class _ProjectCountsImpl extends ProjectCounts {
  _ProjectCountsImpl({
    required int projectId,
    int? likesCount,
    int? quotesCount,
    int? bookmarksCount,
    int? reviewsCount,
    int? vettingsCount,
    int? impressionsCount,
    DateTime? lastImpressionAt,
  }) : super._(
         projectId: projectId,
         likesCount: likesCount,
         quotesCount: quotesCount,
         bookmarksCount: bookmarksCount,
         reviewsCount: reviewsCount,
         vettingsCount: vettingsCount,
         impressionsCount: impressionsCount,
         lastImpressionAt: lastImpressionAt,
       );

  /// Returns a shallow copy of this [ProjectCounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProjectCounts copyWith({
    int? projectId,
    Object? likesCount = _Undefined,
    Object? quotesCount = _Undefined,
    Object? bookmarksCount = _Undefined,
    Object? reviewsCount = _Undefined,
    Object? vettingsCount = _Undefined,
    Object? impressionsCount = _Undefined,
    Object? lastImpressionAt = _Undefined,
  }) {
    return ProjectCounts(
      projectId: projectId ?? this.projectId,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      quotesCount: quotesCount is int? ? quotesCount : this.quotesCount,
      bookmarksCount: bookmarksCount is int?
          ? bookmarksCount
          : this.bookmarksCount,
      reviewsCount: reviewsCount is int? ? reviewsCount : this.reviewsCount,
      vettingsCount: vettingsCount is int? ? vettingsCount : this.vettingsCount,
      impressionsCount: impressionsCount is int?
          ? impressionsCount
          : this.impressionsCount,
      lastImpressionAt: lastImpressionAt is DateTime?
          ? lastImpressionAt
          : this.lastImpressionAt,
    );
  }
}
