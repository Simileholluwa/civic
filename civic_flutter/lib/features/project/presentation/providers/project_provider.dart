import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/project/presentation/state/project_state.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_provider.g.dart';

@riverpod
class ProjectProvider extends _$ProjectProvider {
  final imageHelper = ImageHelper();
  int maxImageCount = 5;

  void setContent(String description) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      description: description,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setTitle(String title) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      title: title,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setStartDate(DateTime startDate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      startDate: startDate,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setEndDate(DateTime endDate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      endDate: endDate,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setProjectStatus(String? status) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      status: status,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setCompletionRate(String completionRate) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      completionRate: double.tryParse(
        completionRate,
      ),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setProjectSubCategory(String? projectSubCategory) {
    final fundingSubCategory = state.fundingSubCategory;
    state = state.copyWith(
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
  }

  void setProjectCategory(String? projectCategory) {
    state = state.copyWith(
      projectCategory: projectCategory,
      projectSubCategory: null,
    );
  }

  void setCurrency(String? currency) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      currency: currency,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setProjectCost(String? projectCost) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectCost: projectCost,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setFundingCategory(String? fundingCategory) {
    state = state.copyWith(
      fundingCategory: fundingCategory,
      fundingSubCategory: null,
    );
  }

  void setFundingSubCategory(String? fundingSubCategory) {
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void setFundingNote(String? fundingNote) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      fundingNote: fundingNote,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void addPhysicalLocation(List<AWSPlaces> physicalLocations) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.physicalLocations == null) {
      state = state.copyWith(physicalLocations: []);
    }

    state = state.copyWith(
      physicalLocations: [
        ...state.physicalLocations!,
        ...physicalLocations,
      ],
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
  }

  void addVirtualLocations(String virtualLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.virtualLocations == null) {
      state = state.copyWith(virtualLocations: []);
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
  }

  void addManualLocation(String manualLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.manualLocations == null) {
      state = state.copyWith(
        manualLocations: [],
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }
    state = state.copyWith(
      manualLocations: [
        ...state.manualLocations!,
        manualLocation,
      ],
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
  }

  void editManualLocation(String manualLocation, int index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.manualLocations == null) {
      state = state.copyWith(
        manualLocations: [],
        fundingSubCategory: fundingSubCategory,
        projectSubCategory: projectSubCategory,
      );
    }
    state.manualLocations![index] = manualLocation;
    state = state.copyWith(
      manualLocations: state.manualLocations,
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void removePhysicalLocation(AWSPlaces physicalLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      physicalLocations: state.physicalLocations!
          .where((element) => element != physicalLocation)
          .toList(),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
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
  }

  void clearVideo() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectVideoUrl: '',
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
  }

  void removeManualLocation(String manualLocation) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      manualLocations: state.manualLocations!
          .where((element) => element != manualLocation)
          .toList(),
      fundingSubCategory: fundingSubCategory,
      projectSubCategory: projectSubCategory,
    );
    canAddLocation();
  }

  void canAddLocation() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
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
    final totalLocations = (state.manualLocations?.length ?? 0) +
        (state.virtualLocations?.length ?? 0) +
        (state.physicalLocations?.length ?? 0);
    return totalLocations;
  }

  Future<void> takePicture() async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments == null) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectImageAttachments!.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.projectImageAttachments!.length < 10) {
      state = state.copyWith(
        projectImageAttachments: [
          ...state.projectImageAttachments!,
          image.path,
        ],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
  }

  Future<void> pickPicture() async {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments == null) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
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
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
      if (image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 5 images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectImageAttachments == null) {
      state = state.copyWith(
        projectImageAttachments: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    if (state.projectImageAttachments!.isEmpty) return;
    var images = state.projectImageAttachments!;
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
  }

  void removeAllImages() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectImageAttachments: [],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
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
    state = state.copyWith(
      pdfAttachmentsThumbnail: [
        ...state.pdfAttachmentsThumbnail!,
        ...thumbnails,
      ],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    return state.pdfAttachmentsThumbnail!;
  }

  void removePDFAtIndex(index) {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    if (state.projectPDFAttachments == null) {
      state = state.copyWith(
        projectPDFAttachments: [],
        pdfAttachmentsThumbnail: [],
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
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
        projectSubCategory: projectSubCategory,
        fundingSubCategory: fundingSubCategory,
      );
    }
    pdfs.removeAt(index);
    thumbnails.removeAt(index);
    state = state.copyWith(
      projectPDFAttachments: [...pdfs],
      pdfAttachmentsThumbnail: [...thumbnails],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
  }

  void removeAllPDFs() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectPDFAttachments: [],
      pdfAttachmentsThumbnail: [],
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
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
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectVideoUrl: video,
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
    ref.read(mediaVideoPlayerProvider(state.projectVideoUrl));
  }

  void removeVideo() {
    final fundingSubCategory = state.fundingSubCategory;
    final projectSubCategory = state.projectSubCategory;
    state = state.copyWith(
      projectVideoUrl: null,
      projectSubCategory: projectSubCategory,
      fundingSubCategory: fundingSubCategory,
    );
  }

  @override
  ProjectState build(Project? project) {
    if (project == null) {
      final projectState = ProjectState.empty();
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            projectState.quillController.document.toDelta().toJson(),
          ),
        );
      });
      return projectState;
    } else {
      final projectState = ProjectState.populate(project);
      projectState.quillController.addListener(() {
        setContent(
          jsonEncode(
            projectState.quillController.document.toDelta().toJson(),
          ),
        );
      });

      return projectState;
    }
  }
}
