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

abstract class PostException
    implements _i1.SerializableException, _i1.SerializableModel {
  PostException._({
    required this.message,
    String? action,
  }) : action = action ?? 'nothing';

  factory PostException({
    required String message,
    String? action,
  }) = _PostExceptionImpl;

  factory PostException.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostException(
      message: jsonSerialization['message'] as String,
      action: jsonSerialization['action'] as String?,
    );
  }

  String message;

  String? action;

  /// Returns a shallow copy of this [PostException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostException copyWith({
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

class _PostExceptionImpl extends PostException {
  _PostExceptionImpl({
    required String message,
    String? action,
  }) : super._(
          message: message,
          action: action,
        );

  /// Returns a shallow copy of this [PostException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostException copyWith({
    String? message,
    Object? action = _Undefined,
  }) {
    return PostException(
      message: message ?? this.message,
      action: action is String? ? action : this.action,
    );
  }
}
