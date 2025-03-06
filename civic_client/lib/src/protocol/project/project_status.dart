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

enum ProjectStatus implements _i1.SerializableModel {
  ongoing,
  completed,
  cancelled,
  paused,
  archived,
  pending,
  abandoned;

  static ProjectStatus fromJson(int index) {
    switch (index) {
      case 0:
        return ProjectStatus.ongoing;
      case 1:
        return ProjectStatus.completed;
      case 2:
        return ProjectStatus.cancelled;
      case 3:
        return ProjectStatus.paused;
      case 4:
        return ProjectStatus.archived;
      case 5:
        return ProjectStatus.pending;
      case 6:
        return ProjectStatus.abandoned;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "ProjectStatus"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
