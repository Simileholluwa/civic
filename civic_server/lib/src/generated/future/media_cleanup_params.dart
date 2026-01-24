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

abstract class MediaCleanupParams
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MediaCleanupParams._({required this.hours});

  factory MediaCleanupParams({required int hours}) = _MediaCleanupParamsImpl;

  factory MediaCleanupParams.fromJson(Map<String, dynamic> jsonSerialization) {
    return MediaCleanupParams(hours: jsonSerialization['hours'] as int);
  }

  int hours;

  /// Returns a shallow copy of this [MediaCleanupParams]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MediaCleanupParams copyWith({int? hours});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MediaCleanupParams',
      'hours': hours,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MediaCleanupParams',
      'hours': hours,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MediaCleanupParamsImpl extends MediaCleanupParams {
  _MediaCleanupParamsImpl({required int hours}) : super._(hours: hours);

  /// Returns a shallow copy of this [MediaCleanupParams]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MediaCleanupParams copyWith({int? hours}) {
    return MediaCleanupParams(hours: hours ?? this.hours);
  }
}
