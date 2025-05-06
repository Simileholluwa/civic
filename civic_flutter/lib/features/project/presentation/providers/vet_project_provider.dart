import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
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

  Future<void> pickImageProof() async {
    final picker = ImageHelper();
    final imageLength = state.images.length;
    final numberToAdd = 5 - imageLength;
    final pickedFile = await picker.pickImage(
      multipleImages: true,
      limit: numberToAdd,
    );
    if (pickedFile != null) {
      if (pickedFile.length > numberToAdd) {
        TToastMessages.infoToast('You can only add $numberToAdd images');
      }
      final imagesToAdd = pickedFile.take(numberToAdd).toList();
      final imagesPath = <String>[];
      for (final image in imagesToAdd) {
        imagesPath.add(
          image.path,
        );
      }
      state = state.copyWith(
        images: [...state.images, ...imagesPath],
      );
      return;
    }
  }

  Future<void> captureImageProof() async {
    final picker = ImageHelper();
    final pickedFile = await picker.takeImage();
    if (pickedFile != null) {
      state = state.copyWith(
        images: [...state.images, pickedFile.path],
      );
      return;
    }
  }

  void clearImages() {
    state = state.copyWith(
      images: [],
    );
  }

  void removeImageAtIndex(index) {
    var images = state.images;
    if (images.length == 1) {
      state = state.copyWith(
        images: [],
      );
    }
    images.removeAt(index);
    state = state.copyWith(
      images: [...images],
    );
  }
}
