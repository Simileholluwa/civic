/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PostException
    implements _i1.SerializableException, _i1.SerializableModel {
  PostException._({required this.message});

  factory PostException({required String message}) = _PostExceptionImpl;

  factory PostException.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostException(message: jsonSerialization['message'] as String);
  }

  String message;

  PostException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PostExceptionImpl extends PostException {
  _PostExceptionImpl({required String message}) : super._(message: message);

  @override
  PostException copyWith({String? message}) {
    return PostException(message: message ?? this.message);
  }
}
