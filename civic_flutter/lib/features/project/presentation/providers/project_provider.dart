import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/project/presentation/state/project_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_provider.g.dart';

@riverpod
class ProjectProvider extends _$ProjectProvider {
  int maxImageCount = 5;
  final imageHelper = ImageHelper();

  void setContent(String description) {
    state = state.copyWith(
      description: description,
    );
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setStartDate(DateTime startDate) {
    state = state.copyWith(
      startDate: startDate,
    );
  }

  void setEndDate(DateTime endDate) {
    state = state.copyWith(endDate: endDate);
  }

  void setProjectStatus(String? status) {
    state = state.copyWith(status: status);
  }

  void setCompletionRate(String completionRate) {
    state = state.copyWith(completionRate: double.tryParse(completionRate));
  }

  void setProjectSubCategory(String? projectSubCategory) {
    state = state.copyWith(projectSubCategory: projectSubCategory);
  }

  void setProjectCategory(String? projectCategory) {
    state = state.copyWith(projectCategory: projectCategory);
  }

  void setCurrency(String? currency) {
    state = state.copyWith(currency: currency);
  }

  void setProjectCost(String? projectCost) {
    state = state.copyWith(projectCost: projectCost);
  }

  void setFundingCategory(String? fundingCategory) {
    state = state.copyWith(fundingCategory: fundingCategory);
  }

  void setFundingSubCategory(String? fundingSubCategory) {
    state = state.copyWith(fundingSubCategory: fundingSubCategory);
  }

  void setFundingNote(String? fundingNote) {
    state = state.copyWith(fundingNote: fundingNote);
  }

  void addPhysicalLocation(List<AWSPlaces> physicalLocations) {
    if (state.physicalLocations == null) {
      state = state.copyWith(physicalLocations: []);
    }

    state = state.copyWith(
      physicalLocations: [
        ...state.physicalLocations!,
        ...physicalLocations,
      ],
    );
    canAddLocation();
  }

  void addVirtualLocations(String virtualLocation) {
    if (state.virtualLocations == null) {
      state = state.copyWith(virtualLocations: []);
    }
    canAddLocation();
  }

  void addManualLocation(String manualLocation) {
    if (state.manualLocations == null) {
      state = state.copyWith(manualLocations: []);
    }

    canAddLocation();
  }

  void removePhysicalLocation(AWSPlaces physicalLocation) {
    state = state.copyWith(
      physicalLocations: state.physicalLocations!
          .where((element) => element != physicalLocation)
          .toList(),
    );
    canAddLocation();
  }

  void removeVirtualLocation(String virtualLocation) {
    canAddLocation();
    state = state.copyWith(
      virtualLocations: state.virtualLocations!
          .where((element) => element != virtualLocation)
          .toList(),
    );
    canAddLocation();
  }

  void removeManualLocation(String manualLocation) {
    canAddLocation();
    state = state.copyWith(
      manualLocations: state.manualLocations!
          .where((element) => element != manualLocation)
          .toList(),
    );
    canAddLocation();
  }

  void canAddLocation() {
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
    if (totalLocations == 3) {
      state = state.copyWith(
        canAddLocations: false,
      );
    }
    log('Total Locations: $totalLocations');
  }

  int numberOfLocations() {
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
    return totalLocations;
  }

  Future<void> takePicture() async {
    if (state.projectImageAttachments == null) {
      state = state.copyWith(projectImageAttachments: []);
    }
    if (state.projectImageAttachments!.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.projectImageAttachments!.length < 10) {
      state = state.copyWith(
        projectImageAttachments: [
          ...state.projectImageAttachments!,
          image.path,
        ],
      );
    }
  }

  Future<void> pickPicture() async {
    if (state.projectImageAttachments == null) {
      state = state.copyWith(projectImageAttachments: []);
    }
    if (state.projectImageAttachments!.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.projectImageAttachments!.length;
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
          ...state.projectImageAttachments!,
          ...imagePaths.take(imageLength),
        ],
      );
      if (image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 5 images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(index) {
    if (state.projectImageAttachments == null) {
      state = state.copyWith(projectImageAttachments: []);
    }
    if (state.projectImageAttachments!.isEmpty) return;
    var images = state.projectImageAttachments!;
    if (images.length == 1) {
      state = state.copyWith(
        projectImageAttachments: [],
      );
    }
    images.removeAt(index);
    state = state.copyWith(
      projectImageAttachments: [...images],
    );
  }

  void removeAllImages() {
    state = state.copyWith(
      projectImageAttachments: [],
    );
  }

  Future<void> pickPDFs() async {
    if (state.projectPDFAttachments == null) {
      state = state.copyWith(projectPDFAttachments: []);
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      List<File> pdfs = result.paths.map((path) => File(path!)).toList();
      List<String> pdfPaths = pdfs.map((pdf) => pdf.path).toList();
      await getPdfThumbnails(pdfPaths);
      state = state.copyWith(
        projectPDFAttachments: [
          ...state.projectPDFAttachments!,
          ...pdfPaths,
        ],
      );
    } else {
      TToastMessages.infoToast('No PDFs selected.');
    }
  }

  Future<void> getPdfThumbnails(List<String> pdfPaths) async {
    if (state.pdfAttachmentsThumbnail == null) {
      state = state.copyWith(pdfAttachmentsThumbnail: []);
    }
    final thumbnails = <String>[];
    for (final pdf in pdfPaths) {
      final pdfDocument = await PdfDocument.openFile(pdf);
      final page = await pdfDocument.getPage(
        1,
      );
      final image = await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageImageFormat.jpeg,
      );
      final filePath = await uint8ListToFile(image!.bytes);
      thumbnails.add(filePath);
      page.close();
      pdfDocument.close();
    }
    state = state.copyWith(
      pdfAttachmentsThumbnail: [
        ...state.pdfAttachmentsThumbnail!,
        ...thumbnails,
      ],
    );
  }

  Future<String> uint8ListToFile(Uint8List uint8List) async {
    final tempDir = await getTemporaryDirectory();
    final file = File(
      '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final createdFile = await file.writeAsBytes(uint8List);
    return createdFile.path;
  }

  void removePDFAtIndex(index) {
    if (state.projectPDFAttachments == null) {
      state = state.copyWith(
        projectPDFAttachments: [],
        pdfAttachmentsThumbnail: [],
      );
    }
    if (state.projectPDFAttachments!.isEmpty ||
        state.pdfAttachmentsThumbnail!.isEmpty) return;
    var pdfs = state.projectPDFAttachments!;
    var thumbnails = state.pdfAttachmentsThumbnail!;
    if (pdfs.length == 1) {
      state = state.copyWith(
        projectPDFAttachments: [],
        pdfAttachmentsThumbnail: [],
      );
    }
    pdfs.removeAt(index);
    thumbnails.removeAt(index);
    state = state.copyWith(
      projectPDFAttachments: [...pdfs],
      pdfAttachmentsThumbnail: [...thumbnails],
    );
  }

  void removeAllPDFs() {
    state = state.copyWith(
      projectPDFAttachments: [],
      pdfAttachmentsThumbnail: [],
    );
  }

   Future<void> takeVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.takeVideo();
    if (video != null) {
      setVideo(video.path);
    }
    TToastMessages.infoToast(
      'No video taken.',
    );
  }

  Future<void> pickVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.pickVideo();
    if (video != null) {
      final fileSizeInBytes = await video.length();
      final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > 20) {
        TToastMessages.infoToast(
          'Video size must be less than 20MB.',
        );
        return;
      }
      setVideo(video.path);
    } else {
      TToastMessages.infoToast(
        'No video selected.',
      );
    }
  }

  void setVideo(String video) {
    state = state.copyWith(projectVideoUrl: video);
    ref.read(mediaVideoPlayerProvider(state.projectVideoUrl));
  }

  void removeVideo() {
    state = state.copyWith(projectVideoUrl: null);
  }

  @override
  ProjectState build(Project? project) {
    if (project == null) {
      final projectState = ProjectState.empty();
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            state.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectState;
    } else {
      final projectState = ProjectState.populate(project);
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            state.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectState;
    }
  }
}
