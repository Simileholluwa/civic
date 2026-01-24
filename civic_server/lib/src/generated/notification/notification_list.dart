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
import 'package:serverpod/serverpod.dart' as _i1;
import '../notification/notification.dart' as _i2;
import 'package:civic_server/src/generated/protocol.dart' as _i3;

abstract class NotificationList
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NotificationList._({
    required this.results,
    required this.count,
    required this.page,
    required this.numPages,
    required this.limit,
    required this.canLoadMore,
  });

  factory NotificationList({
    required List<_i2.AppNotification> results,
    required int count,
    required int page,
    required int numPages,
    required int limit,
    required bool canLoadMore,
  }) = _NotificationListImpl;

  factory NotificationList.fromJson(Map<String, dynamic> jsonSerialization) {
    return NotificationList(
      results: _i3.Protocol().deserialize<List<_i2.AppNotification>>(
        jsonSerialization['results'],
      ),
      count: jsonSerialization['count'] as int,
      page: jsonSerialization['page'] as int,
      numPages: jsonSerialization['numPages'] as int,
      limit: jsonSerialization['limit'] as int,
      canLoadMore: jsonSerialization['canLoadMore'] as bool,
    );
  }

  List<_i2.AppNotification> results;

  int count;

  int page;

  int numPages;

  int limit;

  bool canLoadMore;

  /// Returns a shallow copy of this [NotificationList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationList copyWith({
    List<_i2.AppNotification>? results,
    int? count,
    int? page,
    int? numPages,
    int? limit,
    bool? canLoadMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationList',
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
      '__className__': 'NotificationList',
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

class _NotificationListImpl extends NotificationList {
  _NotificationListImpl({
    required List<_i2.AppNotification> results,
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

  /// Returns a shallow copy of this [NotificationList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationList copyWith({
    List<_i2.AppNotification>? results,
    int? count,
    int? page,
    int? numPages,
    int? limit,
    bool? canLoadMore,
  }) {
    return NotificationList(
      results: results ?? this.results.map((e0) => e0.copyWith()).toList(),
      count: count ?? this.count,
      page: page ?? this.page,
      numPages: numPages ?? this.numPages,
      limit: limit ?? this.limit,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }
}
