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

abstract class AWSPlaces
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AWSPlaces._({
    required this.place,
    required this.latitude,
    required this.longitude,
  });

  factory AWSPlaces({
    required String place,
    required double latitude,
    required double longitude,
  }) = _AWSPlacesImpl;

  factory AWSPlaces.fromJson(Map<String, dynamic> jsonSerialization) {
    return AWSPlaces(
      place: jsonSerialization['place'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  String place;

  double latitude;

  double longitude;

  /// Returns a shallow copy of this [AWSPlaces]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AWSPlaces copyWith({
    String? place,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AWSPlaces',
      'place': place,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AWSPlaces',
      'place': place,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AWSPlacesImpl extends AWSPlaces {
  _AWSPlacesImpl({
    required String place,
    required double latitude,
    required double longitude,
  }) : super._(
         place: place,
         latitude: latitude,
         longitude: longitude,
       );

  /// Returns a shallow copy of this [AWSPlaces]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AWSPlaces copyWith({
    String? place,
    double? latitude,
    double? longitude,
  }) {
    return AWSPlaces(
      place: place ?? this.place,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
