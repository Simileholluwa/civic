import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_pdf_thumbnail_provider.g.dart';

@riverpod
Future<List<Uint8List>> projectPdfThumbnail(
  Ref ref,
  List<String> pdfPaths,
) async {
  if (pdfPaths.isEmpty) {
    return [];
  }
  final thumbnails = <Uint8List>[];
  final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
  for (var pdf in pdfPaths) {
    if (regex.hasMatch(pdf)) {
      pdf = await fetchAndCachePDF(pdf);
      if (pdf.isEmpty) {
        log('Skipping invalid PDF URL: $pdf');
        continue;
      }
    }
    try {
      final pdfDocument = await PdfDocument.openFile(pdf);
      final page = await pdfDocument.getPage(
        1,
      );
      final image = await page.render(
        width: page.width,
        height: page.height,
      );
      thumbnails.add(image!.bytes);
      await page.close();
      await pdfDocument.close();
    } on Exception catch (e) {
      log('Error processing PDF: $e');
      continue;
    }
  }
  return thumbnails;
}

Future<String> fetchAndCachePDF(String url) async {
  try {
    final cacheDir = await getTemporaryDirectory();
    final fileName = Uri.parse(url).pathSegments.last;
    final filePath = '${cacheDir.path}/$fileName';
    final cachedFile = File(filePath);
    if (cachedFile.existsSync()) {
      return cachedFile.path;
    }
    final dio = Dio();
    await dio.download(url, filePath);
    return filePath;
  } on Exception catch (e) {
    log('Error downloading PDF: $e');
    return '';
  }
}
