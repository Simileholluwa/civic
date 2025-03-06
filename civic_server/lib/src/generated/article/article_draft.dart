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

abstract class ArticleDraft
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArticleDraft._({
    this.draftId,
    this.ownerId,
    required this.banner,
    required this.content,
    required this.title,
    this.createdAt,
  });

  factory ArticleDraft({
    int? draftId,
    int? ownerId,
    required String banner,
    required String content,
    required String title,
    DateTime? createdAt,
  }) = _ArticleDraftImpl;

  factory ArticleDraft.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleDraft(
      draftId: jsonSerialization['draftId'] as int?,
      ownerId: jsonSerialization['ownerId'] as int?,
      banner: jsonSerialization['banner'] as String,
      content: jsonSerialization['content'] as String,
      title: jsonSerialization['title'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  int? draftId;

  int? ownerId;

  String banner;

  String content;

  String title;

  DateTime? createdAt;

  /// Returns a shallow copy of this [ArticleDraft]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArticleDraft copyWith({
    int? draftId,
    int? ownerId,
    String? banner,
    String? content,
    String? title,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (draftId != null) 'draftId': draftId,
      if (ownerId != null) 'ownerId': ownerId,
      'banner': banner,
      'content': content,
      'title': title,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (draftId != null) 'draftId': draftId,
      if (ownerId != null) 'ownerId': ownerId,
      'banner': banner,
      'content': content,
      'title': title,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleDraftImpl extends ArticleDraft {
  _ArticleDraftImpl({
    int? draftId,
    int? ownerId,
    required String banner,
    required String content,
    required String title,
    DateTime? createdAt,
  }) : super._(
          draftId: draftId,
          ownerId: ownerId,
          banner: banner,
          content: content,
          title: title,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ArticleDraft]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArticleDraft copyWith({
    Object? draftId = _Undefined,
    Object? ownerId = _Undefined,
    String? banner,
    String? content,
    String? title,
    Object? createdAt = _Undefined,
  }) {
    return ArticleDraft(
      draftId: draftId is int? ? draftId : this.draftId,
      ownerId: ownerId is int? ? ownerId : this.ownerId,
      banner: banner ?? this.banner,
      content: content ?? this.content,
      title: title ?? this.title,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
