
import 'package:civic_client/civic_client.dart';

class VetProjectState {
  final bool isSending;
  final bool isEditing;
  final bool isDeleting;
  final String comment;
  final List<String> images;
  final String status;
  VetProjectState({
    this.isSending = false,
   this.isEditing = false,
   this.isDeleting = false,
   required this.comment,
   required this.images,
   required this.status,
  });

  VetProjectState copyWith({
    bool? isSending,
    bool? isEditing,
    bool? isDeleting,
    String? comment,
    List<String>? images,
    String? status,
  }) {
    return VetProjectState(
      isSending: isSending ?? this.isSending,
      isEditing: isEditing ?? this.isEditing,
      isDeleting: isDeleting ?? this.isDeleting,
      comment: comment ?? this.comment,
      images: images ?? this.images,
      status: status ?? this.status,
    );
  }

  factory VetProjectState.populate(ProjectVetting projectVetting) {
    return VetProjectState(
      comment: projectVetting.comment ?? '',
      images: projectVetting.images ?? <String>[],
      status: projectVetting.status ?? '',
      isEditing: true,
    );
  }

  factory VetProjectState.empty() {
    return VetProjectState(
      comment: '',
      images: <String>[],
      status: '',
    );
  }
}
