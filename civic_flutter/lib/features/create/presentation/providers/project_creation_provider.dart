import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_creation_provider.g.dart';

Timer? _quillDebounce;

@riverpod
class CreateProjectNotif extends _$CreateProjectNotif {
  static final imageHelper = ImageHelper();
  static const int maxImageCount = 5;

  late final TextEditingController _titleController;
  late final QuillController _quillController;
  late final TextEditingController _startDateController;
  late final TextEditingController _endDateController;
  late final TextEditingController _projectCostController;
  late final TextEditingController _fundingNoteController;

  void _onTitleControllerChanged() => setTitle(_titleController.text);
  void _onProjectCostControllerChanged() =>
      setProjectCost(_projectCostController.text);
  void _onFundingNoteControllerChanged() =>
      setFundingNote(_fundingNoteController.text);
  late final TextEditingController _virtualLocationController;
  late final ScrollController _scrollController;
  late final FocusNode _descriptionFocusNode;

  TextEditingController get titleController => _titleController;
  QuillController get quillController => _quillController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get projectCostController => _projectCostController;
  TextEditingController get fundingNoteController => _fundingNoteController;
  TextEditingController get virtualLocationController =>
      _virtualLocationController;
  ScrollController get scrollController => _scrollController;
  FocusNode get descriptionFocusNode => _descriptionFocusNode;

  Project? _baselineProject;
  int? _currentDraftId;

  @override
  ProjectCreationState build(Project? project) {
    _titleController = TextEditingController(text: project?.title);
    _scrollController = ScrollController();
    _descriptionFocusNode = FocusNode();
    _quillController = QuillController(
      document: project?.description != null &&
              project!.description!.trim().isNotEmpty
          ? Document.fromJson(
              jsonDecode(
                project.description!,
              ) as List,
            )
          : Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
    _startDateController = TextEditingController(
      text: project?.startDate == null
          ? null
          : DateFormat('MMM d, y').format(project!.startDate!),
    );
    _endDateController = TextEditingController(
      text: project?.endDate == null
          ? null
          : DateFormat('MMM d, y').format(project!.endDate!),
    );
    _projectCostController = TextEditingController(
      text: project?.projectCost == null
          ? null
          : NumberFormat('#,##0.##').format(
              project!.projectCost,
            ),
    );
    _fundingNoteController = TextEditingController(
      text: project?.fundingNote,
    );
    _virtualLocationController = TextEditingController();

    final initialState = project == null
        ? ProjectCreationState.empty()
        : ProjectCreationState.populate(project);

    _baselineProject = project;

    _quillController.addListener(_onQuillChanged);
    _titleController.addListener(_onTitleControllerChanged);
    _projectCostController.addListener(_onProjectCostControllerChanged);
    _fundingNoteController.addListener(_onFundingNoteControllerChanged);

    ref.onDispose(() {
      _titleController.dispose();
      _quillController.dispose();
      _startDateController.dispose();
      _endDateController.dispose();
      _projectCostController.dispose();
      _fundingNoteController.dispose();
      _virtualLocationController.dispose();
      _quillController.removeListener(_onQuillChanged);
      _titleController.removeListener(_onTitleControllerChanged);
      _projectCostController.removeListener(_onProjectCostControllerChanged);
      _fundingNoteController.removeListener(_onFundingNoteControllerChanged);
      _quillDebounce?.cancel();
    });

    return initialState;
  }

  void _setBaseline(Project? project) {
    _baselineProject = project;
    _updateIsDirty();
  }

  void _updateIsDirty() {
    final baseline = _baselineProject;

    var different = false;

    if (baseline == null) {
      different = state.title.isNotEmpty ||
          (_plainTextFromDelta(state.description).trim().isNotEmpty) ||
          state.projectImageAttachments.isNotEmpty ||
          (state.projectPDFAttachments?.isNotEmpty ?? false) ||
          (state.virtualLocations?.isNotEmpty ?? false) ||
          state.physicalLocations.isNotEmpty ||
          state.projectCategory != null ||
          state.projectSubCategory != null ||
          state.fundingCategory != null ||
          state.fundingSubCategory != null ||
          state.projectCost > 0.0;
    } else {
      final baselineDesc = _plainTextFromDelta(
        baseline.description,
      );
      final stateDesc = _plainTextFromDelta(
        state.description,
      );

      final baselineImages = Set<String>.from(
        baseline.projectImageAttachments ?? [],
      );
      final stateImages = Set<String>.from(
        state.projectImageAttachments,
      );

      final baselinePdfs = Set<String>.from(
        baseline.projectPDFAttachments ?? [],
      );
      final statePdfs = Set<String>.from(
        state.projectPDFAttachments ?? [],
      );

      final baselineVirtual = Set<String>.from(
        baseline.virtualLocations ?? [],
      );
      final stateVirtual = Set<String>.from(
        state.virtualLocations ?? [],
      );

      final baselinePlaces = Set<String>.from(
        (baseline.physicalLocations ?? []).map(
          (p) => p.place,
        ),
      );
      final statePlaces = Set<String>.from(
        state.physicalLocations.map(
          (p) => p.place,
        ),
      );

      different = (baseline.title ?? '') != state.title ||
          baselineDesc != stateDesc ||
          baseline.startDate != state.startDate ||
          baseline.endDate != state.endDate ||
          (baseline.currency ?? '') != (state.currency) ||
          (baseline.projectCost ?? 0.0) != state.projectCost ||
          (baseline.fundingCategory ?? '') != (state.fundingCategory ?? '') ||
          (baseline.fundingSubCategory ?? '') !=
              (state.fundingSubCategory ?? '') ||
          (baseline.projectCategory ?? '') != (state.projectCategory ?? '') ||
          (baseline.projectSubCategory ?? '') !=
              (state.projectSubCategory ?? '') ||
          !setEquals(baselineImages, stateImages) ||
          !setEquals(baselinePdfs, statePdfs) ||
          !setEquals(baselineVirtual, stateVirtual) ||
          !setEquals(baselinePlaces, statePlaces);
    }

    if (state.isDirty != different) {
      state = state.copyWith(isDirty: different);
    }
  }

  void _onQuillChanged() {
    _quillDebounce?.cancel();
    _quillDebounce = Timer(const Duration(milliseconds: 300), () {
      final descriptionJson = jsonEncode(
        _quillController.document.toDelta().toJson(),
      );
      if (descriptionJson != state.description) {
        state = state.copyWith(description: descriptionJson);
        _updateIsDirty();
      }
    });
  }

  String _plainTextFromDelta(String? deltaJson) {
    if (deltaJson == null || deltaJson.trim().isEmpty) return '';
    try {
      final doc = Document.fromJson(jsonDecode(deltaJson) as List);
      return doc.toPlainText();
    } on Exception catch (_) {
      return deltaJson;
    }
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
    _updateIsDirty();
    log('Is dirty after title change: ${state.isDirty}');
  }

  void setStartDate(DateTime startDate) {
    state = state.copyWith(startDate: startDate);
    _updateIsDirty();
  }

  void setEndDate(DateTime endDate) {
    state = state.copyWith(endDate: endDate);
    _updateIsDirty();
  }

  void setProjectStatus(String? status) {
    state = state.copyWith(status: status);
    _updateIsDirty();
  }

  void setProjectSubCategory(String? projectSubCategory) {
    state = state.copyWith(projectSubCategory: projectSubCategory);
    _updateIsDirty();
    log('Is dirty after subcategory change: ${state.isDirty}');
  }

  void setProjectCategory(String? projectCategory) {
    if (state.projectCategory == projectCategory) return;
    state = state.copyWith(
      projectCategory: projectCategory,
      projectSubCategory: null,
    );
    _updateIsDirty();
  }

  void setCurrency(String? currency) {
    state = state.copyWith(currency: currency);
    _updateIsDirty();
  }

  void setProjectCost(String? projectCost) {
    final cost = double.tryParse(projectCost?.replaceAll(',', '') ?? '') ?? 0.0;
    state = state.copyWith(projectCost: cost);
    _updateIsDirty();
  }

  void setFundingCategory(String? fundingCategory) {
    if (state.fundingCategory == fundingCategory) return;
    state = state.copyWith(
      fundingCategory: fundingCategory,
      fundingSubCategory: null,
    );
    _updateIsDirty();
  }

  void setFundingSubCategory(String? fundingSubCategory) {
    state = state.copyWith(fundingSubCategory: fundingSubCategory);
    _updateIsDirty();
  }

  void setFundingNote(String? fundingNote) {
    state = state.copyWith(fundingNote: fundingNote);
    _updateIsDirty();
  }

  void addPhysicalLocation(List<AWSPlaces> physicalLocations) {
    state = state.copyWith(
      physicalLocations: [...state.physicalLocations, ...physicalLocations],
    );
    _updateIsDirty();
    _updateCanAddLocation();
  }

  void addVirtualLocations(String virtualLocation) {
    state = state.copyWith(
      virtualLocations: [...?state.virtualLocations, virtualLocation],
    );
    _updateIsDirty();
    _updateCanAddLocation();
  }

  void editVirtualLocation(String virtualLocation, int index) {
    if (state.virtualLocations == null ||
        index >= state.virtualLocations!.length) {
      return;
    }
    final newLocations = List<String>.from(state.virtualLocations!);
    newLocations[index] = virtualLocation;
    state = state.copyWith(virtualLocations: newLocations);
    _updateIsDirty();
  }

  void removePhysicalLocation(AWSPlaces physicalLocation) {
    final newLocations = List<AWSPlaces>.from(state.physicalLocations)
      ..remove(physicalLocation);
    state = state.copyWith(physicalLocations: newLocations);
    _updateIsDirty();
    _updateCanAddLocation();
  }

  void removeVirtualLocation(String virtualLocation) {
    final newLocations = List<String>.from(state.virtualLocations ?? [])
      ..remove(virtualLocation);
    state = state.copyWith(virtualLocations: newLocations);
    _updateIsDirty();
    _updateCanAddLocation();
  }

  void _updateCanAddLocation() {
    final totalLocations =
        (state.virtualLocations?.length ?? 0) + state.physicalLocations.length;
    state = state.copyWith(canAddLocations: totalLocations < 4);
  }

  int numberOfLocations() {
    return (state.virtualLocations?.length ?? 0) +
        state.physicalLocations.length;
  }

  Future<void> takePicture() async {
    if (state.projectImageAttachments.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null) {
      state = state.copyWith(
        projectImageAttachments: [...state.projectImageAttachments, image.path],
      );
      _updateIsDirty();
    }
  }

  Future<void> pickPicture() async {
    if (state.projectImageAttachments.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.projectImageAttachments.length;
    final images = await imageHelper.pickImage(
      multipleImages: imageLength > 1,
    );
    if (images != null) {
      final imagePaths = images.map((img) => img.path).toList();
      state = state.copyWith(
        projectImageAttachments: [
          ...state.projectImageAttachments,
          ...imagePaths.take(imageLength),
        ],
      );
      _updateIsDirty();
      if (images.length > imageLength) {
        TToastMessages.infoToast('A maximum of 5 images can be uploaded.');
      }
    }
  }

  void removeImageAtIndex(int index) {
    if (index < 0 || index >= state.projectImageAttachments.length) return;
    final newImages = List<String>.from(state.projectImageAttachments)
      ..removeAt(index);
    state = state.copyWith(projectImageAttachments: newImages);
    _updateIsDirty();
  }

  void removeAllImages() {
    state = state.copyWith(projectImageAttachments: []);
    _updateIsDirty();
  }

  Future<void> pickPDFs() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final pdfPaths = result.paths.map((path) => path!).toList();
      state = state.copyWith(
        projectPDFAttachments: [...?state.projectPDFAttachments, ...pdfPaths],
      );
      _updateIsDirty();
    } else {
      TToastMessages.infoToast('No PDFs selected.');
    }
  }

  void removePDFAtIndex(int index) {
    if (state.projectPDFAttachments == null ||
        index < 0 ||
        index >= state.projectPDFAttachments!.length) {
      return;
    }
    final newPdfs = List<String>.from(state.projectPDFAttachments!)
      ..removeAt(index);
    state = state.copyWith(projectPDFAttachments: newPdfs);
    _updateIsDirty();
  }

  void removeAllPDFs() {
    state = state.copyWith(projectPDFAttachments: []);
    _updateIsDirty();
  }

  bool validateProject() {
    if (state.isValid) {
      return true;
    }
    if (state.title.isEmpty || state.description.isEmpty) {
      TToastMessages.infoToast('Title and description are required.');
    } else if (state.projectCategory == null ||
        state.projectSubCategory == null) {
      TToastMessages.infoToast('Category is required.');
    } else {
      TToastMessages.infoToast('Please fill in all required fields.');
    }
    return false;
  }

  void setImages(List<String> images) {
    state = state.copyWith(projectImageAttachments: images);
    _updateIsDirty();
  }

  void setPDFAttachments(List<String> pdfs) {
    state = state.copyWith(projectPDFAttachments: pdfs);
    _updateIsDirty();
  }

  Future<bool> _sendMediaAttachments({
    required List<String>? attachments,
    required String folder,
    required String subFolder,
    required void Function(List<String>) onUploadSuccess,
  }) async {
    if (attachments == null || attachments.isEmpty) return true;

    final existingUploads = <String>[];
    final newUploads = <String>[];
    final urlRegex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');

    for (final attachment in attachments) {
      if (urlRegex.hasMatch(attachment)) {
        existingUploads.add(attachment);
      } else {
        newUploads.add(attachment);
      }
    }

    if (newUploads.isEmpty) return true;

    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          newUploads,
          folder,
          subFolder,
        );

    return result.fold(
      (error) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        return false;
      },
      (urls) {
        onUploadSuccess(existingUploads + urls);
        return true;
      },
    );
  }

  Future<bool> saveProjectDraft() async {
    final saveDraft = ref.read(saveProjectDraftProvider);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final draftProject = _buildProjectFromState(
      ownerId: ownerId,
      id: _currentDraftId ?? DateTime.now().millisecondsSinceEpoch,
    );

    final result = await saveDraft(
      SaveProjectDraftParams(draftProject),
    );
    return result.fold(
      (l) {
        TToastMessages.errorToast(l.message);
        return false;
      },
      (_) {
        _setBaseline(draftProject);
        _currentDraftId = draftProject.id;
        return true;
      },
    );
  }

  Future<void> sendMediaAndModifyContent(
    List<String> embeddedImages,
    String content,
  ) async {
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          embeddedImages,
          'embedded_project_images',
          'images',
        );

    return result.fold((error) async {
      TToastMessages.errorToast(error);
      await saveProjectDraft();
      TToastMessages.errorToast(
        'Unable to upload embedded images. Project has been saved as draft.',
      );
      return;
    }, (mediaUrls) {
      final pathReplacements = THelperFunctions.mapEmbededImages(
        embeddedImages,
        mediaUrls,
      );
      final modifiedContent = THelperFunctions.modifyArticleContent(
        content,
        pathReplacements,
      );

      // Persist the modified description into state so subsequent steps send the updated content
      state = state.copyWith(description: modifiedContent);
      return;
    });
  }

  Project _buildProjectFromState({
    required int? id,
    required int ownerId,
  }) {
    return Project(
      id: id,
      ownerId: ownerId,
      title: state.title.trim(),
      description: state.description.trim(),
      projectCategory: state.projectCategory,
      projectSubCategory: state.projectSubCategory,
      startDate: state.startDate,
      endDate: state.endDate,
      currency: state.currency,
      projectCost: state.projectCost,
      fundingCategory: state.fundingCategory,
      fundingSubCategory: state.fundingSubCategory,
      fundingNote: state.fundingNote,
      physicalLocations: state.physicalLocations,
      virtualLocations: state.virtualLocations,
      projectImageAttachments: state.projectImageAttachments,
      projectPDFAttachments: state.projectPDFAttachments,
    );
  }

  Future<void> sendProject(int? projectId) async {
    // Prevent accidental double submit
    if (ref.read(sendPostLoadingProvider.notifier).value) return;
    ref.read(sendPostLoadingProvider.notifier).value = true;
    // Keep provider alive for the duration of the submission (survives navigation/rebuild)
    final keepAliveLink = ref.keepAlive();

    const maxAttempts = 3;
    var attempt = 0;
    var backoff = const Duration(milliseconds: 600);

    // Basic client-side validation
    if (!validateProject()) {
      ref.read(sendPostLoadingProvider.notifier).value = false;
      return;
    }

    final embeddedImages = THelperFunctions.getAllImagesFromEditor(
      state.description,
    );
    try {
      while (true) {
        attempt++;
        try {
          // Upload embedded editor images first (content modified on success)
          if (embeddedImages.isNotEmpty) {
            await sendMediaAndModifyContent(
              embeddedImages,
              state.description,
            );
          }

          final imagesUploaded = await _sendMediaAttachments(
            attachments: state.projectImageAttachments,
            folder: 'projects',
            subFolder: 'images',
            onUploadSuccess: setImages,
          );
          if (!imagesUploaded) {
            throw Exception('Unable to upload images.');
          }

          final pdfsUploaded = await _sendMediaAttachments(
            attachments: state.projectPDFAttachments,
            folder: 'projects',
            subFolder: 'pdfs',
            onUploadSuccess: setPDFAttachments,
          );
          if (!pdfsUploaded) {
            throw Exception('Unable to upload PDFs.');
          }

          final ownerId = ref.read(localStorageProvider).getInt('userId')!;
          final outgoingProject = _buildProjectFromState(
            id: projectId,
            ownerId: ownerId,
          );

          final saveProject = ref.read(saveProjectProvider);
          final result = await saveProject(
            SaveProjectParams(outgoingProject),
          );

          final success = await result.fold(
            (error) async {
              throw Exception(error.message);
            },
            (response) async {
              // Only after success, update paginated lists
              final realProject = response;
              if (projectId == null) {
                ref
                    .read(
                      paginatedProjectListProvider('').notifier,
                    )
                    .addProject(realProject);
              } else {
                ref
                    .read(
                      paginatedProjectListProvider('').notifier,
                    )
                    .updateProject(realProject);
              }
              TToastMessages.successToast(
                'Your project was sent.',
              );
              _setBaseline(realProject);
              return true;
            },
          );
          if (success) break; // Done
        } on Exception catch (e) {
          if (attempt >= maxAttempts) {
            await saveProjectDraft();
            TToastMessages.errorToast(
              '$e. Project has been saved as draft.',
            );
            break;
          }
          // Backoff before retrying
          await Future<void>.delayed(backoff);
          backoff *= 2;
        }
      }
    } finally {
      ref.read(sendPostLoadingProvider.notifier).value = false;
      // Release keep-alive so provider can dispose normally after completion
      keepAliveLink.close();
    }
  }

  void loadDraft(Project draft) {
    _titleController.text = draft.title ?? '';
    _quillController.document =
        draft.description != null && draft.description!.trim().isNotEmpty
            ? Document.fromJson(jsonDecode(draft.description!) as List)
            : Document();
    _startDateController.text = draft.startDate == null
        ? ''
        : DateFormat('MMM d, y').format(draft.startDate!);
    _endDateController.text = draft.endDate == null
        ? ''
        : DateFormat('MMM d, y').format(draft.endDate!);
    _projectCostController.text = draft.projectCost == null
        ? ''
        : NumberFormat('#,##0.##').format(
            draft.projectCost,
          );
    _fundingNoteController.text = draft.fundingNote ?? '';

    state = ProjectCreationState.populate(draft).copyWith(isDirty: false);
    _setBaseline(draft);
    // Track the loaded draft id so saving overwrites this draft rather than creating a new one.
    _currentDraftId = draft.id;
    log(state.toString());
  }
}
