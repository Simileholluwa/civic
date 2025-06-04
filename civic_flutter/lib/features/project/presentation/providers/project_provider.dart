// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_provider.g.dart';

@riverpod
class ProjectProvider extends _$ProjectProvider {
  static final imageHelper = ImageHelper();
  static int maxImageCount = 5;

  void setContent(String description) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      description: description,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setTitle(String title) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      title: title,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setStartDate(DateTime startDate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      startDate: startDate,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setEndDate(DateTime endDate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      endDate: endDate,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setProjectStatus(String? status) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      status: status,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setCompletionRate(String completionRate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setProjectSubCategory(String? projectSubCategory) {
    final fundingSubCategory = state.fundingSubCategory;
    state = state.copyWith(
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setProjectCategory(String? projectCategory) {
    final fundingSubCategory = state.fundingSubCategory;
    state = state.copyWith(
      projectCategory: projectCategory,
      projectSubCategory: null,
      fundingCategory: fundingSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setCurrency(String? currency) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      currency: currency,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setProjectCost(String? projectCost) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectCost: double.tryParse(
        projectCost!.replaceAll(
          RegExp(r','),
          '',
        ),
      ),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setFundingCategory(String? fundingCategory) {
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingCategory: fundingCategory,
      fundingSubCategory: null,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setFundingSubCategory(String? fundingSubCategory) {
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void setFundingNote(String? fundingNote) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingNote: fundingNote,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void addPhysicalLocation(List<AWSPlaces> physicalLocations) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.physicalLocations.isEmpty) {
      state = state.copyWith(
        physicalLocations: [],
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }

    state = state.copyWith(
      physicalLocations: [
        ...state.physicalLocations,
        ...physicalLocations,
      ],
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
    setIsValid();
    setCanSave();
  }

  void addVirtualLocations(String virtualLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.virtualLocations == null) {
      state = state.copyWith(
        virtualLocations: [],
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }
    state = state.copyWith(
      virtualLocations: [
        ...state.virtualLocations!,
        virtualLocation,
      ],
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
    setIsValid();
    setCanSave();
  }

  void editVirtualLocation(String virtualLocation, int index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.virtualLocations == null) {
      state = state.copyWith(
        virtualLocations: [],
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }
    state.virtualLocations![index] = virtualLocation;
    state = state.copyWith(
      virtualLocations: state.virtualLocations,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void removePhysicalLocation(AWSPlaces physicalLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      physicalLocations: state.physicalLocations
          .where((element) => element != physicalLocation)
          .toList(),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
    setIsValid();
    setCanSave();
  }

  void removeVirtualLocation(String virtualLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      virtualLocations: state.virtualLocations!
          .where((element) => element != virtualLocation)
          .toList(),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
    setIsValid();
    setCanSave();
  }

  void canAddLocation() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    final totalLocations = (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations.length);
    if (totalLocations == 3) {
      state = state.copyWith(
        canAddLocations: false,
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    } else {
      state = state.copyWith(
        canAddLocations: true,
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }
  }

  int numberOfLocations() {
    final totalLocations = (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations.length);
    return totalLocations;
  }

  Future<void> takePicture() async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments.isEmpty) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectImageAttachments.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.projectImageAttachments.length < 10) {
      state = state.copyWith(
        projectImageAttachments: [
          ...state.projectImageAttachments,
          image.path,
        ],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    setIsValid();
    setCanSave();
  }

  Future<void> pickPicture() async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments.isEmpty) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectImageAttachments.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.projectImageAttachments.length;
    final image = await imageHelper.pickImage(
      multipleImages: imageLength > 1 ? true : false,
    );
    if (image != null) {
      var imagePaths = <String>[];
      for (final img in image) {
        imagePaths.add(img.path);
      }
      state = state.copyWith(
        projectImageAttachments: [
          ...state.projectImageAttachments,
          ...imagePaths.take(imageLength),
        ],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
      if (image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 5 images can be uploaded.',
        );
      }
    }
    setIsValid();
    setCanSave();
  }

  void removeImageAtIndex(index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments.isEmpty) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectImageAttachments.isEmpty) return;
    var images = state.projectImageAttachments;
    if (images.length == 1) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    images.removeAt(index);
    state = state.copyWith(
      projectImageAttachments: [...images],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  void removeAllImages() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectImageAttachments: [],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    setIsValid();
    setCanSave();
  }

  Future<void> pickPDFs() async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectPDFAttachments == null) {
      state = state.copyWith(
        projectPDFAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      List<File> pdfs = result.paths.map((path) => File(path!)).toList();
      List<String> pdfPaths = pdfs.map((pdf) => pdf.path).toList();
      state = state.copyWith(
        projectPDFAttachments: [
          ...state.projectPDFAttachments!,
          ...pdfPaths,
        ],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    } else {
      TToastMessages.infoToast('No PDFs selected.');
    }
  }

  Future<String> fetchAndCachePDF(url) async {
    try {
      final cacheDir = await getTemporaryDirectory();
      final dio = Dio();
      final filePath =
          '${cacheDir.path}/${DateTime.now().millisecondsSinceEpoch}.pdf';
      await dio.download(url, filePath);

      return filePath;
    } catch (e) {
      log('Error downloading PDF: $e');
      return '';
    }
  }

  Future<List<Uint8List>> getPdfThumbnails(List<String> pdfPaths) async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.pdfAttachmentsThumbnail == null) {
      state = state.copyWith(
        pdfAttachmentsThumbnail: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }

    final thumbnails = <Uint8List>[];
    final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    for (var pdf in pdfPaths) {
      if (regex.hasMatch(pdf)) {
        pdf = await fetchAndCachePDF(pdf);
      }
      final pdfDocument = await PdfDocument.openFile(pdf);
      final page = await pdfDocument.getPage(
        1,
      );
      final image = await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageImageFormat.jpeg,
      );
      thumbnails.add(image!.bytes);
      page.close();
      pdfDocument.close();
    }
    log(thumbnails.toString());
    state = state.copyWith(
      pdfAttachmentsThumbnail: [
        ...state.pdfAttachmentsThumbnail!,
        ...thumbnails,
      ],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    return thumbnails;
  }

  void removePDFAtIndex(index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectPDFAttachments == null) {
      state = state.copyWith(
        projectPDFAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectPDFAttachments!.isEmpty) return;
    var pdfs = state.projectPDFAttachments!;
    if (pdfs.length == 1) {
      state = state.copyWith(
        projectPDFAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    pdfs.removeAt(index);
    state = state.copyWith(
      projectPDFAttachments: [...pdfs],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
  }

  void removeAllPDFs() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectPDFAttachments: [],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
  }

  void setCanSave() {
    state = state.copyWith(
    canSave: state.title.isNotEmpty ||
          state.description.isNotEmpty ||
          state.projectCategory != null ||
          state.projectSubCategory != null ||
          state.startDate != null ||
          state.endDate != null ||
          state.currency != null ||
          state.projectCost != 0.0 ||
          state.fundingCategory != null ||
          state.fundingSubCategory != null ||
          state.physicalLocations.isNotEmpty ||
          state.projectImageAttachments.isNotEmpty,
    );
  }

  void setIsValid() {
    state = state.copyWith(
      isValid: state.title.isNotEmpty &&
          state.description.isNotEmpty &&
          state.projectCategory != null &&
          state.projectSubCategory != null &&
          state.startDate != null &&
          state.endDate != null &&
          state.currency != null &&
          state.projectCost != 0.0 &&
          state.fundingCategory != null &&
          state.fundingSubCategory != null &&
          state.physicalLocations.isNotEmpty &&
          state.projectImageAttachments.isNotEmpty,
    );
  }

  bool validateProject() {
    final validations = [
      validateOverview(),
      validateCategory(),
      validateStatus(),
      validateFunding(),
      validateLocation(),
      validateAttachment(),
      validateDates()
    ];

    if (validations.every((validation) => validation)) {
      return true;
    }

    if (!validateDates()) {
      TToastMessages.infoToast('End date must be after start date.');
    } else if (!validateOverview()) {
      TToastMessages.infoToast('Title and description are required.');
    } else if (!validateCategory()) {
      TToastMessages.infoToast('Category is required.');
    } else if (!validateStatus()) {
      TToastMessages.infoToast('Status is required.');
    } else if (!validateFunding()) {
      TToastMessages.infoToast('Funding details are required.');
    } else if (!validateLocation()) {
      TToastMessages.infoToast('Location is required.');
    } else if (!validateAttachment()) {
      TToastMessages.infoToast('Attachment is required.');
    } else {
      TToastMessages.infoToast('Please fill in all required fields.');
    }

    return false;
  }

  bool validateDates() {
    if (state.startDate != null && state.endDate != null) {
      return state.startDate!.isBefore(state.endDate!) ||
          state.startDate!.isAtSameMomentAs(state.endDate!);
    }
    return true;
  }

  bool validateOverview() {
    return state.title.isNotEmpty && state.description.isNotEmpty;
  }

  bool validateCategory() {
    return state.projectCategory != null && state.projectSubCategory != null;
  }

  bool validateStatus() {
    return state.startDate != null && state.endDate != null;
  }

  bool validateFunding() {
    return state.fundingCategory != null &&
        state.fundingSubCategory != null &&
        state.currency != null &&
        state.projectCost != 0.0;
  }

  bool validateLocation() {
    return state.physicalLocations.isNotEmpty ||
        (state.virtualLocations ?? []).isNotEmpty;
  }

  bool validateAttachment() {
    return state.projectImageAttachments.isNotEmpty;
  }

  void setImages(List<String> images) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
      projectImageAttachments: [...images],
    );
  }

  void setPDFAttachments(List<String> pdfs) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
      projectPDFAttachments: [...pdfs],
    );
  }

  Future<bool> sendImageAttachments() async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (state.projectImageAttachments.isEmpty) return false;

    for (final image in state.projectImageAttachments) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (regex.hasMatch(image)) {
        existingUpload.add(image);
      } else {
        newUpload.add(image);
      }
    }
    if (newUpload.isEmpty) return true;
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          newUpload,
          'projects',
          'images',
        );

    return result.fold((error) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      log(error);
      return false;
    }, (imageUrls) {
      setImages(existingUpload + imageUrls);
      return true;
    });
  }

  Future<bool> sendPDFAttachments() async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (state.projectPDFAttachments == null) return true;
    if ((state.projectPDFAttachments ?? []).isEmpty) return true;

    for (final pdf in state.projectPDFAttachments!) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (regex.hasMatch(pdf)) {
        existingUpload.add(pdf);
      } else {
        newUpload.add(pdf);
      }
    }

    if (newUpload.isEmpty) return true;
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          newUpload,
          'projects',
          'pdfs',
        );

    return result.fold((error) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      log(error);
      return false;
    }, (pdfUrls) {
      setPDFAttachments(existingUpload + pdfUrls);
      return true;
    });
  }

  Future<void> saveProjectDraft() async {
    final saveDraft = ref.read(saveProjectDraftProvider);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final result = await saveDraft(
      SaveProjectDraftParams(
        Project(
          ownerId: ownerId,
          title: state.title,
          description: state.description,
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
        ),
      ),
    );
    result.fold((l) {
      log(l.message);
    }, (_) {
      return;
    });
  }

  Future<void> sendProject(int? projectId) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final imageUrls = await sendImageAttachments();
    if (!imageUrls) {
      await saveProjectDraft();
      TToastMessages.errorToast(
          'Unable to upload images. Project has been saved as draft.');
      return;
    }
    final pdfUrls = await sendPDFAttachments();
    if (!pdfUrls) {
      await saveProjectDraft();
      TToastMessages.errorToast(
          'Unable to upload PDFs. Project has been saved as draft.');
      return;
    }

    final saveProject = ref.read(saveProjectProvider);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;

    final result = await saveProject(
      SaveProjectParams(
        Project(
          id: projectId,
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
        ),
      ),
    );

    return result.fold((error) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      log(error.message);
      saveProjectDraft();
      TToastMessages.errorToast(
          "${error.message}. Project has been saved as draft.");
      return;
    }, (response) async {
      final deleteDraft = ref.read(deleteProjectDraftProvider);
      await deleteDraft(NoParams());
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      TToastMessages.successToast(
        'Your project was sent.',
      );
      ref
          .watch(
            paginatedProjectListProvider.notifier,
          )
          .addProject(
            response,
          );
      return;
    });
  }

  @override
  ProjectCreationState build(Project? project) {
    if (project == null) {
      final projectCreationSate = ProjectCreationState.empty();
      projectCreationSate.quillController.addListener(() {
        setContent(
          jsonEncode(
            projectCreationSate.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectCreationSate;
    } else if (project.title == null || project.description == null) {
      final projectCreationSate = ProjectCreationState.empty();
      projectCreationSate.quillController.addListener(() {
        setContent(
          jsonEncode(
            projectCreationSate.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectCreationSate;
    } else {
      final projectCreationSate = ProjectCreationState.populate(project);
      projectCreationSate.quillController.addListener(() {
        setContent(
          jsonEncode(
            projectCreationSate.quillController.document.toDelta().toJson(),
          ),
        );
      });

      return projectCreationSate;
    }
  }
}
