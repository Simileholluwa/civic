import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vet_project_provider.g.dart';

@riverpod
class ProjectVet extends _$ProjectVet {
  @override
  VetProjectState build(ProjectVetting? projectVetting) {
    if (projectVetting == null) {
      return VetProjectState.empty();
    } else if (projectVetting.comment?.isEmpty ?? true) {
      return VetProjectState.empty();
    } else {
      return VetProjectState.populate(
        projectVetting,
      );
    }
  }

  void setComment(String comment) {
    state = state.copyWith(
      comment: comment,
    );
  }

  void setImages(List<String> images) {
    state = state.copyWith(
      images: images,
    );
  }

  void setStatus(String status) {
    state = state.copyWith(
      status: status,
    );
  }

  void setIsSending(bool isSending) {
    state = state.copyWith(
      isSending: isSending,
    );
  }

  void setIsEditing(bool isEditing) {
    state = state.copyWith(
      isEditing: isEditing,
    );
  }

  void setIsDeleting(bool isDeleting) {
    state = state.copyWith(
      isDeleting: isDeleting,
    );
  }
}