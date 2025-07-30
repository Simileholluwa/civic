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

abstract class ServerSideException
    implements _i1.SerializableException, _i1.SerializableModel {
  ServerSideException._({
    required this.message,
    String? action,
  }) : action = action ?? 'nothing';

  factory ServerSideException({
    required String message,
    String? action,
  }) = _ServerSideExceptionImpl;

  factory ServerSideException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerSideException(
      message: jsonSerialization['message'] as String,
      action: jsonSerialization['action'] as String?,
    );
  }

  String message;

  String? action;

  /// Returns a shallow copy of this [ServerSideException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerSideException copyWith({
    String? message,
    String? action,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (action != null) 'action': action,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerSideExceptionImpl extends ServerSideException {
  _ServerSideExceptionImpl({
    required String message,
    String? action,
  }) : super._(
          message: message,
          action: action,
        );

  /// Returns a shallow copy of this [ServerSideException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerSideException copyWith({
    String? message,
    Object? action = _Undefined,
  }) {
    return ServerSideException(
      message: message ?? this.message,
      action: action is String? ? action : this.action,
    );
  }
}
