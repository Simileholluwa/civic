import 'dart:convert';
import 'dart:typed_data';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectCreationState {
  ProjectCreationState({
    required this.focusNode,
    required this.scrollController,
    required this.titleController,
    required this.quillController,
    required this.completionRateController,
    required this.startDateController,
    required this.endDateController,
    required this.projectCostController,
    required this.fundingNoteController,
    required this.manualLocationController,
    required this.virtualLocationController,
    required this.canAddLocations,
    this.pdfAttachmentsThumbnail,
    this.title,
    this.description,
    this.projectCategory,
    this.projectSubCategory,
    this.status,
    this.startDate,
    this.endDate,
    this.currency,
    this.fundingCategory,
    this.fundingSubCategory,
    this.projectCost,
    this.fundingNote,
    this.projectImageAttachments,
    this.projectPDFAttachments,
    this.physicalLocations,
    this.virtualLocations,
    this.completionRate,
    this.manualLocations,
    this.projectVideoUrl,
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
      completionRateController: TextEditingController(),
      manualLocationController: TextEditingController(),
      virtualLocationController: TextEditingController(),
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
      title: project.title,
      description: project.description,
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(text: project.title),
      quillController: QuillController(
        document: document,
        selection: const TextSelection.collapsed(offset: 0),
      ),
      startDateController:
          TextEditingController(text: project.startDate?.toString()),
      endDateController:
          TextEditingController(text: project.endDate?.toString()),
      startDate: project.startDate,
      endDate: project.endDate,
      currency: project.currency,
      projectCostController: TextEditingController(text: project.projectCost.toString(),),
      projectCost: project.projectCost,
      fundingNoteController: TextEditingController(text: project.fundingNote),
      fundingNote: project.fundingNote,
      projectImageAttachments: project.projectImageAttachments,
      projectPDFAttachments: project.projectPDFAttachments,
      completionRate: project.completionRate,
      virtualLocations: project.virtualLocations,
      physicalLocations: project.physicalLocations,
      fundingCategory: project.fundingCategory,
      fundingSubCategory: project.fundingSubCategory,
      status: project.status,
      projectCategory: project.projectCategory,
      projectSubCategory: project.projectSubCategory,
      manualLocations: project.manualLocations,
      completionRateController: TextEditingController(
        text: project.completionRate?.toString(),
      ),
      manualLocationController: TextEditingController(),
      virtualLocationController: TextEditingController(),
      canAddLocations: [
        ...?project.manualLocations,
        ...?project.virtualLocations,
        ...?project.physicalLocations?.map(
          (locations) => locations.place,
        ),
      ].length < 4,
      projectVideoUrl: project.projectVideoUrl,
    );
  }

  final double? completionRate;
  final String? currency;
  final TextEditingController completionRateController;
  final String? description;
  final DateTime? endDate;
  final TextEditingController endDateController;
  final FocusNode focusNode;
  final String? fundingCategory;
  final String? fundingNote;
  final TextEditingController fundingNoteController;
  final String? fundingSubCategory;
  final List<AWSPlaces>? physicalLocations;
  final String? projectCategory;
  final double? projectCost;
  final TextEditingController projectCostController;
  final List<String>? projectImageAttachments;
  final List<String>? projectPDFAttachments;
  final String? projectSubCategory;
  final QuillController quillController;
  final ScrollController scrollController;
  final DateTime? startDate;
  final TextEditingController startDateController;
  final String? status;
  final String? title;
  final List<Uint8List>? pdfAttachmentsThumbnail;
  final TextEditingController titleController;
  final List<String>? virtualLocations;
  final List<String>? manualLocations;
  final TextEditingController manualLocationController;
  final TextEditingController virtualLocationController;
  final bool canAddLocations;
  final String? projectVideoUrl;
  

  ProjectCreationState copyWith({
    String? title,
    String? description,
    FocusNode? focusNode,
    ScrollController? scrollController,
    TextEditingController? titleController,
    QuillController? quillController,
    String? projectCategory,
    String? projectSubCategory,
    String? status,
    TextEditingController? startDateController,
    TextEditingController? endDateController,
    DateTime? startDate,
    DateTime? endDate,
    String? currency,
    String? fundingCategory,
    String? fundingSubCategory,
    TextEditingController? projectCostController,
    double? projectCost,
    TextEditingController? fundingNoteController,
    String? fundingNote,
    List<String>? projectImageAttachments,
    List<String>? projectPDFAttachments,
    double? completionRate,
    List<AWSPlaces>? physicalLocations,
    List<String>? virtualLocations,
    List<String>? manualLocations,
    TextEditingController? completionRateController,
    TextEditingController? manualLocationController,
    TextEditingController? virtualLocationController,
    bool? canAddLocations,
    List<Uint8List>? pdfAttachmentsThumbnail,
    String? projectVideoUrl,
  }) {
    return ProjectCreationState(
      title: title ?? this.title,
      description: description ?? this.description,
      focusNode: focusNode ?? this.focusNode,
      scrollController: scrollController ?? this.scrollController,
      titleController: titleController ?? this.titleController,
      quillController: quillController ?? this.quillController,
      projectCategory: projectCategory ?? this.projectCategory,
      projectSubCategory: projectSubCategory ,
      status: status ?? this.status,
      startDateController: startDateController ?? this.startDateController,
      endDateController: endDateController ?? this.endDateController,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      currency: currency ?? this.currency,
      fundingCategory: fundingCategory ?? this.fundingCategory,
      fundingSubCategory: fundingSubCategory,
      projectCostController:
          projectCostController ?? this.projectCostController,
      projectCost: projectCost ?? this.projectCost,
      fundingNoteController:
          fundingNoteController ?? this.fundingNoteController,
      fundingNote: fundingNote ?? this.fundingNote,
      projectImageAttachments:
          projectImageAttachments ?? this.projectImageAttachments,
      projectPDFAttachments:
          projectPDFAttachments ?? this.projectPDFAttachments,
      completionRate: completionRate ?? this.completionRate,
      physicalLocations: physicalLocations ?? this.physicalLocations,
      virtualLocations: virtualLocations ?? this.virtualLocations,
      manualLocations: manualLocations ?? this.manualLocations,
      completionRateController:
          completionRateController ?? this.completionRateController,
      manualLocationController:
          manualLocationController ?? this.manualLocationController,
      virtualLocationController:
          virtualLocationController ?? this.virtualLocationController,
      canAddLocations: canAddLocations ?? this.canAddLocations,
      projectVideoUrl: projectVideoUrl ?? this.projectVideoUrl,
    );
  }
}
