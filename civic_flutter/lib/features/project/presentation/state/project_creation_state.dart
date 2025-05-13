// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:civic_client/civic_client.dart';
import 'package:intl/intl.dart';

class ProjectCreationState {
  ProjectCreationState({
    required this.focusNode,
    required this.scrollController,
    required this.titleController,
    required this.quillController,
    required this.startDateController,
    required this.endDateController,
    required this.projectCostController,
    required this.fundingNoteController,
    required this.virtualLocationController,
    required this.canAddLocations,
    this.isValid = false,
    this.canSave = false,
    this.pdfAttachmentsThumbnail,
    required this.title,
    required this.description,
    this.projectCategory,
    this.projectSubCategory,
    this.status,
    this.startDate,
    this.endDate,
    this.currency,
    this.fundingCategory,
    this.fundingSubCategory,
    required this.projectCost,
    this.fundingNote,
    required this.projectImageAttachments,
    this.projectPDFAttachments,
    required this.physicalLocations,
    this.virtualLocations,
  });

  factory ProjectCreationState.empty() {
    return ProjectCreationState(
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(),
      quillController: QuillController.basic(),
      startDateController: TextEditingController(),
      endDateController: TextEditingController(),
      projectCostController: TextEditingController(),
      fundingNoteController: TextEditingController(),
      virtualLocationController: TextEditingController(),
      title: '',
      description: '',
      projectCost: 0.0,
      projectImageAttachments: [],
      physicalLocations: [],
      canAddLocations: true,
    );
  }

  factory ProjectCreationState.populate(Project project) {
    Document? document;
    if (project.description != null) {
      document = Document.fromJson(
        jsonDecode(project.description!),
      );
    } else {
      document = Document();
    }
    return ProjectCreationState(
      title: project.title!,
      description: project.description!,
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(text: project.title),
      quillController: QuillController(
        document: document,
        selection: const TextSelection.collapsed(offset: 0),
      ),
      startDateController: TextEditingController(
        text: project.startDate == null
            ? null
            : DateFormat('MMM d, y').format(
                project.startDate!,
              ),
      ),
      endDateController: TextEditingController(
        text: project.endDate == null
            ? null
            : DateFormat('MMM d, y').format(
                project.endDate!,
              ),
      ),
      startDate: project.startDate,
      endDate: project.endDate,
      currency: project.currency,
      projectCostController: TextEditingController(
        text: project.projectCost == null
            ? null
            : NumberFormat("#,##0.##").format(
                project.projectCost!,
              ),
      ),
      projectCost: project.projectCost!,
      fundingNoteController: TextEditingController(text: project.fundingNote),
      fundingNote: project.fundingNote,
      projectImageAttachments: project.projectImageAttachments!,
      projectPDFAttachments: project.projectPDFAttachments,
      virtualLocations: project.virtualLocations,
      physicalLocations: project.physicalLocations!,
      fundingCategory: project.fundingCategory,
      fundingSubCategory: project.fundingSubCategory,
      projectCategory: project.projectCategory,
      projectSubCategory: project.projectSubCategory,
      virtualLocationController: TextEditingController(),
      canAddLocations: [
            ...?project.virtualLocations,
            ...?project.physicalLocations?.map(
              (locations) => locations.place,
            ),
          ].length <
          4,
    );
  }

  final String? currency;
  final String description;
  final DateTime? endDate;
  final TextEditingController endDateController;
  final FocusNode focusNode;
  final String? fundingCategory;
  final String? fundingNote;
  final TextEditingController fundingNoteController;
  final String? fundingSubCategory;
  final List<AWSPlaces> physicalLocations;
  final String? projectCategory;
  final double projectCost;
  final TextEditingController projectCostController;
  final List<String> projectImageAttachments;
  final List<String>? projectPDFAttachments;
  final String? projectSubCategory;
  final QuillController quillController;
  final ScrollController scrollController;
  final DateTime? startDate;
  final TextEditingController startDateController;
  final String? status;
  final String title;
  final List<Uint8List>? pdfAttachmentsThumbnail;
  final TextEditingController titleController;
  final List<String>? virtualLocations;
  final TextEditingController virtualLocationController;
  final bool canAddLocations;
  final bool isValid;
  final bool canSave;

  ProjectCreationState copyWith({
    String? currency,
    String? description,
    DateTime? endDate,
    TextEditingController? endDateController,
    FocusNode? focusNode,
    String? fundingCategory,
    String? fundingNote,
    TextEditingController? fundingNoteController,
    String? fundingSubCategory,
    List<AWSPlaces>? physicalLocations,
    String? projectCategory,
    double? projectCost,
    TextEditingController? projectCostController,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    String? projectSubCategory,
    QuillController? quillController,
    ScrollController? scrollController,
    DateTime? startDate,
    TextEditingController? startDateController,
    String? status,
    String? title,
    List<Uint8List>? pdfAttachmentsThumbnail,
    TextEditingController? titleController,
    List<String>? virtualLocations,
    TextEditingController? virtualLocationController,
    bool? canAddLocations,
    bool? isValid,
    bool? canSave,
  }) {
    return ProjectCreationState(
      currency: currency ?? this.currency,
      description: description ?? this.description,
      endDate: endDate ?? this.endDate,
      endDateController: endDateController ?? this.endDateController,
      focusNode: focusNode ?? this.focusNode,
      fundingCategory: fundingCategory ?? this.fundingCategory,
      fundingNote: fundingNote ?? this.fundingNote,
      fundingNoteController:
          fundingNoteController ?? this.fundingNoteController,
      fundingSubCategory: fundingSubCategory ?? this.fundingSubCategory,
      physicalLocations: physicalLocations ?? this.physicalLocations,
      projectCategory: projectCategory ?? this.projectCategory,
      projectCost: projectCost ?? this.projectCost,
      projectCostController:
          projectCostController ?? this.projectCostController,
      projectImageAttachments:
          projectImageAttachments ?? this.projectImageAttachments,
      projectPDFAttachments:
          projectPDFAttachments ?? this.projectPDFAttachments,
      projectSubCategory: projectSubCategory ?? this.projectSubCategory,
      quillController: quillController ?? this.quillController,
      scrollController: scrollController ?? this.scrollController,
      startDate: startDate ?? this.startDate,
      startDateController: startDateController ?? this.startDateController,
      status: status ?? this.status,
      title: title ?? this.title,
      pdfAttachmentsThumbnail:
          pdfAttachmentsThumbnail ?? this.pdfAttachmentsThumbnail,
      titleController: titleController ?? this.titleController,
      virtualLocations: virtualLocations ?? this.virtualLocations,
      virtualLocationController:
          virtualLocationController ?? this.virtualLocationController,
      canAddLocations: canAddLocations ?? this.canAddLocations,
      isValid: isValid ?? this.isValid,
      canSave: canSave ?? this.canSave,
    );
  }
}
