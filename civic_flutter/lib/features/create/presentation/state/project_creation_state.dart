import 'dart:typed_data';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

// Sentinel used in copyWith to distinguish between an explicit null and an
// omitted parameter for nullable category-related fields.
const _unset = Object();

class ProjectCreationState {
  ProjectCreationState({
    this.canAddLocations = true,
    this.title = '',
    this.description = '',
    this.projectCost = 0,
    this.currency = 'NGN',
    this.startDate,
    this.endDate,
    this.projectCategory,
    this.projectSubCategory,
    this.fundingCategory,
    this.fundingSubCategory,
    this.fundingNote,
    this.status,
    this.projectImageAttachments = const [],
    this.projectPDFAttachments,
    this.pdfAttachmentsThumbnail,
    this.physicalLocations = const [],
    this.virtualLocations,
    this.isDirty = false,
    this.descriptionFocusNode,
    this.endDateController,
    this.startDateController,
    this.fundingNoteController,
    this.projectCostController,
    this.quillController,
    this.scrollController,
    this.titleController,
    this.virtualLocationController,
  });

  /// Empty initial state.
  factory ProjectCreationState.empty() => ProjectCreationState();

  factory ProjectCreationState.populate(Project project) {
    return ProjectCreationState(
      title: project.title ?? '',
      description: project.description ?? '',
      startDate: project.startDate,
      endDate: project.endDate,
      currency: project.currency ?? 'NGN',
      projectCost: project.projectCost ?? 0,
      fundingNote: project.fundingNote,
      projectImageAttachments: project.projectImageAttachments ?? [],
      projectPDFAttachments: project.projectPDFAttachments,
      virtualLocations: project.virtualLocations,
      physicalLocations: project.physicalLocations ?? [],
      fundingCategory: project.fundingCategory,
      fundingSubCategory: project.fundingSubCategory,
      projectCategory: project.projectCategory,
      projectSubCategory: project.projectSubCategory,
      canAddLocations: (project.virtualLocations?.length ?? 0) +
              (project.physicalLocations?.length ?? 0) <
          4,
    );
  }
  final bool canAddLocations;
  final String title;
  final String description;
  final double projectCost;
  final String currency;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? projectCategory;
  final String? projectSubCategory;
  final String? fundingCategory;
  final String? fundingSubCategory;
  final String? fundingNote;
  final String? status;
  final List<String> projectImageAttachments;
  final List<String>? projectPDFAttachments;
  final List<Uint8List>? pdfAttachmentsThumbnail;
  final List<AWSPlaces> physicalLocations;
  final List<String>? virtualLocations;
  final bool isDirty;
  TextEditingController? titleController;
  TextEditingController? startDateController;
  TextEditingController? endDateController;
  TextEditingController? projectCostController;
  TextEditingController? fundingNoteController;
  TextEditingController? virtualLocationController;
  ScrollController? scrollController;
  FocusNode? descriptionFocusNode;
  QuillController? quillController;

  ProjectCreationState copyWith({
    bool? canAddLocations,
    String? title,
    String? description,
    double? projectCost,
    String? currency,
    DateTime? startDate,
    DateTime? endDate,
    Object? projectCategory = _unset,
    Object? projectSubCategory = _unset,
    Object? fundingCategory = _unset,
    Object? fundingSubCategory = _unset,
    String? fundingNote,
    String? status,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    List<AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    bool? isDirty,
    TextEditingController? titleController,
    TextEditingController? startDateController,
    TextEditingController? endDateController,
    TextEditingController? projectCostController,
    TextEditingController? fundingNoteController,
    TextEditingController? virtualLocationController,
    ScrollController? scrollController,
    FocusNode? descriptionFocusNode,
    QuillController? quillController,
  }) {
    return ProjectCreationState(
      canAddLocations: canAddLocations ?? this.canAddLocations,
      title: title ?? this.title,
      description: description ?? this.description,
      projectCost: projectCost ?? this.projectCost,
      currency: currency ?? this.currency,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      projectCategory: identical(projectCategory, _unset)
          ? this.projectCategory
          : projectCategory as String?,
      projectSubCategory: identical(projectSubCategory, _unset)
          ? this.projectSubCategory
          : projectSubCategory as String?,
      fundingCategory: identical(fundingCategory, _unset)
          ? this.fundingCategory
          : fundingCategory as String?,
      fundingSubCategory: identical(fundingSubCategory, _unset)
          ? this.fundingSubCategory
          : fundingSubCategory as String?,
      fundingNote: fundingNote ?? this.fundingNote,
      status: status ?? this.status,
      projectImageAttachments: projectImageAttachments ??
          List<String>.from(this.projectImageAttachments),
      projectPDFAttachments:
          projectPDFAttachments ?? this.projectPDFAttachments,
      physicalLocations:
          physicalLocations ?? List<AWSPlaces>.from(this.physicalLocations),
      virtualLocations: virtualLocations ?? this.virtualLocations,
      isDirty: isDirty ?? this.isDirty,
      titleController: titleController ?? this.titleController,
      startDateController: startDateController ?? this.startDateController,
      endDateController: endDateController ?? this.endDateController,
      projectCostController:
          projectCostController ?? this.projectCostController,
      fundingNoteController:
          fundingNoteController ?? this.fundingNoteController,
      virtualLocationController:
          virtualLocationController ?? this.virtualLocationController,
      scrollController: scrollController ?? this.scrollController,
      descriptionFocusNode: descriptionFocusNode ?? this.descriptionFocusNode,
      quillController: quillController ?? this.quillController,
    );
  }

  bool get isValid =>
      title.isNotEmpty &&
      description.isNotEmpty &&
      projectCategory != null &&
      projectSubCategory != null &&
      startDate != null &&
      endDate != null &&
      (startDate!.isBefore(endDate!) ||
          startDate!.isAtSameMomentAs(endDate!)) &&
      projectCost > 0.0 &&
      fundingCategory != null &&
      fundingSubCategory != null &&
      (physicalLocations.isNotEmpty || (virtualLocations ?? []).isNotEmpty) &&
      projectImageAttachments.isNotEmpty;

  @override
  String toString() {
    return 'ProjectCreationState(title: $title, description: ${description.length} chars, projectCost: $projectCost, isDirty: $isDirty)';
  }
}
