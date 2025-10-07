import 'dart:developer';

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
    isValid();
  }

  void setImages(List<String> images) {
    state = state.copyWith(
      images: [...state.images, ...images],
    );
    isValid();
  }

  void setStatus(String status) {
    state = state.copyWith(
      status: status,
    );
    isValid();
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

  void isValid() {
    state = state.copyWith(
      isValid: state.comment.isNotEmpty &&
          state.status != null &&
          state.images.isNotEmpty,
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
    }
    return;
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

  void removeImageAtIndex(int index) {
    final images = state.images;
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

  Future<bool> sendVettingImages() async {
    final existingUpload = <String>[];
    final newUpload = <String>[];
    for (final image in state.images) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (regex.hasMatch(image)) {
        existingUpload.add(image);
      } else {
        newUpload.add(image);
      }
    }
    if (newUpload.isEmpty) {
      return true;
    }
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          newUpload,
          'projects',
          'images',
        );

    return result.fold((error) async {
      log(error, name: 'Vetting images upload failed');
      return false;
    }, (imageUrls) {
      state = state.copyWith(
        images: [
          ...(existingUpload + imageUrls),
        ],
      );
      return true;
    });
  }

  Future<bool> sendVetting(
    int projectId,
    int? vettingId,
  ) async {
    setIsSending(true);
    final sendVetting = ref.read(vetProjectProvider);
    final ownerId = ref.read(localStorageProvider).getInt('userId');
    final sendImages = await sendVettingImages();
    if (!sendImages) {
      TToastMessages.errorToast(
        'There was a problem uploading images. Please try again.',
      );
      return false;
    }
    final projectVetting = ProjectVetting(
      id: vettingId,
      projectId: projectId,
      ownerId: ownerId!,
      images: state.images,
      comment: state.comment,
      status: state.status,
    );
    final result = await sendVetting(
      VetProjectParams(
        projectVetting,
      ),
    );
    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      setIsSending(false);
      return false;
    }, (success) {
      final vettingList =
          ref.read(paginatedProjectVettingListProvider.notifier);
      TToastMessages.successToast(
        'Your vetting has been succesfully submitted.',
      );
      if (vettingList.pagingController.itemList != null && vettingId == null) {
        vettingList.addVetting(success);
      }
      setIsSending(false);
      return true;
    });
  }

  Future<bool> deleteVetting(int vettingId) async {
    setIsDeleting(true);
    final deleteVetting = ref.read(deleteProjectVettingProvider);
    final result = await deleteVetting(
      DeleteProjectVettingParams(
        vettingId,
      ),
    );
    setIsDeleting(false);
    return result.fold(
      (failure) {
        TToastMessages.errorToast(failure.message);
        return false;
      },
      (_) async {
        TToastMessages.successToast(
          'Your vetting was deleted successfully',
        );
        ref
            .read(
              paginatedProjectVettingListProvider.notifier,
            )
            .deleteVetting(vettingId);
        return true;
      },
    );
  }
}
