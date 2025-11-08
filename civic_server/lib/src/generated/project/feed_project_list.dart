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
import '../project/project_with_user_state.dart' as _i2;

abstract class FeedProjectList
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FeedProjectList._({
    required this.results,
    required this.count,
    required this.page,
    required this.numPages,
    required this.limit,
    required this.canLoadMore,
  });

  factory FeedProjectList({
    required List<_i2.ProjectWithUserState> results,
    required int count,
    required int page,
    required int numPages,
    required int limit,
    required bool canLoadMore,
  }) = _FeedProjectListImpl;

  factory FeedProjectList.fromJson(Map<String, dynamic> jsonSerialization) {
    return FeedProjectList(
      results: (jsonSerialization['results'] as List)
          .map((e) =>
              _i2.ProjectWithUserState.fromJson((e as Map<String, dynamic>)))
          .toList(),
      count: jsonSerialization['count'] as int,
      page: jsonSerialization['page'] as int,
      numPages: jsonSerialization['numPages'] as int,
      limit: jsonSerialization['limit'] as int,
      canLoadMore: jsonSerialization['canLoadMore'] as bool,
    );
  }

  List<_i2.ProjectWithUserState> results;

  int count;

  int page;

  int numPages;

  int limit;

  bool canLoadMore;

  /// Returns a shallow copy of this [FeedProjectList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FeedProjectList copyWith({
    List<_i2.ProjectWithUserState>? results,
    int? count,
    int? page,
    int? numPages,
    int? limit,
    bool? canLoadMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'results': results.toJson(valueToJson: (v) => v.toJson()),
      'count': count,
      'page': page,
      'numPages': numPages,
      'limit': limit,
      'canLoadMore': canLoadMore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'results': results.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'count': count,
      'page': page,
      'numPages': numPages,
      'limit': limit,
      'canLoadMore': canLoadMore,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FeedProjectListImpl extends FeedProjectList {
  _FeedProjectListImpl({
    required List<_i2.ProjectWithUserState> results,
    required int count,
    required int page,
    required int numPages,
    required int limit,
    required bool canLoadMore,
  }) : super._(
          results: results,
          count: count,
          page: page,
          numPages: numPages,
          limit: limit,
          canLoadMore: canLoadMore,
        );

  /// Returns a shallow copy of this [FeedProjectList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FeedProjectList copyWith({
    List<_i2.ProjectWithUserState>? results,
    int? count,
    int? page,
    int? numPages,
    int? limit,
    bool? canLoadMore,
  }) {
    return FeedProjectList(
      results: results ?? this.results.map((e0) => e0.copyWith()).toList(),
      count: count ?? this.count,
      page: page ?? this.page,
      numPages: numPages ?? this.numPages,
      limit: limit ?? this.limit,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }
}
