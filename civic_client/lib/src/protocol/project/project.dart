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
import '../protocol.dart' as _i2;

abstract class Project implements _i1.SerializableModel {
  Project._({
    this.id,
    required this.ownerId,
    this.owner,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.images,
    required this.startDate,
    required this.endDate,
    this.completionRate,
    this.cost,
    this.currency,
    this.locations,
    this.fundingSources,
  });

  factory Project({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String title,
    required String description,
    required List<String> category,
    required _i2.ProjectStatus status,
    required List<String> images,
    required DateTime startDate,
    required DateTime endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  }) = _ProjectImpl;

  factory Project.fromJson(Map<String, dynamic> jsonSerialization) {
    return Project(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserRecord.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: (jsonSerialization['category'] as List)
          .map((e) => e as String)
          .toList(),
      status: _i2.ProjectStatus.fromJson((jsonSerialization['status'] as int)),
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      completionRate: (jsonSerialization['completionRate'] as num?)?.toDouble(),
      cost: (jsonSerialization['cost'] as num?)?.toDouble(),
      currency: jsonSerialization['currency'] as String?,
      locations: (jsonSerialization['locations'] as List?)
          ?.map((e) => _i2.AWSPlaces.fromJson((e as Map<String, dynamic>)))
          .toList(),
      fundingSources: (jsonSerialization['fundingSources'] as List?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ownerId;

  _i2.UserRecord? owner;

  String title;

  String description;

  List<String> category;

  _i2.ProjectStatus status;

  List<String> images;

  DateTime startDate;

  DateTime endDate;

  double? completionRate;

  double? cost;

  String? currency;

  List<_i2.AWSPlaces>? locations;

  List<String>? fundingSources;

  Project copyWith({
    int? id,
    int? ownerId,
    _i2.UserRecord? owner,
    String? title,
    String? description,
    List<String>? category,
    _i2.ProjectStatus? status,
    List<String>? images,
    DateTime? startDate,
    DateTime? endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'title': title,
      'description': description,
      'category': category.toJson(),
      'status': status.toJson(),
      'images': images.toJson(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      if (completionRate != null) 'completionRate': completionRate,
      if (cost != null) 'cost': cost,
      if (currency != null) 'currency': currency,
      if (locations != null)
        'locations': locations?.toJson(valueToJson: (v) => v.toJson()),
      if (fundingSources != null) 'fundingSources': fundingSources?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectImpl extends Project {
  _ProjectImpl({
    int? id,
    required int ownerId,
    _i2.UserRecord? owner,
    required String title,
    required String description,
    required List<String> category,
    required _i2.ProjectStatus status,
    required List<String> images,
    required DateTime startDate,
    required DateTime endDate,
    double? completionRate,
    double? cost,
    String? currency,
    List<_i2.AWSPlaces>? locations,
    List<String>? fundingSources,
  }) : super._(
          id: id,
          ownerId: ownerId,
          owner: owner,
          title: title,
          description: description,
          category: category,
          status: status,
          images: images,
          startDate: startDate,
          endDate: endDate,
          completionRate: completionRate,
          cost: cost,
          currency: currency,
          locations: locations,
          fundingSources: fundingSources,
        );

  @override
  Project copyWith({
    Object? id = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    String? title,
    String? description,
    List<String>? category,
    _i2.ProjectStatus? status,
    List<String>? images,
    DateTime? startDate,
    DateTime? endDate,
    Object? completionRate = _Undefined,
    Object? cost = _Undefined,
    Object? currency = _Undefined,
    Object? locations = _Undefined,
    Object? fundingSources = _Undefined,
  }) {
    return Project(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserRecord? ? owner : this.owner?.copyWith(),
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category.map((e0) => e0).toList(),
      status: status ?? this.status,
      images: images ?? this.images.map((e0) => e0).toList(),
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      completionRate:
          completionRate is double? ? completionRate : this.completionRate,
      cost: cost is double? ? cost : this.cost,
      currency: currency is String? ? currency : this.currency,
      locations: locations is List<_i2.AWSPlaces>?
          ? locations
          : this.locations?.map((e0) => e0.copyWith()).toList(),
      fundingSources: fundingSources is List<String>?
          ? fundingSources
          : this.fundingSources?.map((e0) => e0).toList(),
    );
  }
}
