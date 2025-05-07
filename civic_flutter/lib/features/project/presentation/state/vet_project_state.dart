
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class VetProjectState {
  final bool isSending;
  final bool isEditing;
  final bool isDeleting;
  final bool isValid;
  final String comment;
  final List<String> images;
  final String? status;
  final TextEditingController commentController;
  VetProjectState({
    this.isSending = false,
   this.isEditing = false,
   this.isDeleting = false,
   this.isValid = false,
   required this.comment,
   required this.images,
   required this.status,
   required this.commentController,
  });

  VetProjectState copyWith({
    bool? isSending,
    bool? isEditing,
    bool? isDeleting,
    bool? isValid,
    String? comment,
    List<String>? images,
    String? status,
    TextEditingController? commentController,
  }) {
    return VetProjectState(
      isSending: isSending ?? this.isSending,
      isEditing: isEditing ?? this.isEditing,
      isDeleting: isDeleting ?? this.isDeleting,
      comment: comment ?? this.comment,
      images: images ?? this.images,
      status: status ?? this.status,
      commentController: commentController ?? this.commentController,
      isValid: isValid ?? this.isValid,
    );
  }

  factory VetProjectState.populate(ProjectVetting projectVetting) {
    return VetProjectState(
      comment: projectVetting.comment ?? '',
      images: projectVetting.images ?? <String>[],
      status: projectVetting.status ?? '',
      isEditing: true,
      isValid: false,
      commentController: TextEditingController(text: projectVetting.comment),
    );
  }

  factory VetProjectState.empty() {
    return VetProjectState(
      comment: '',
      images: <String>[],
      status: null,
      commentController: TextEditingController(),
    );
  }
}
