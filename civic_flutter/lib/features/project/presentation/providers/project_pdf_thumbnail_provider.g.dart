// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_pdf_thumbnail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectPdfThumbnail)
const projectPdfThumbnailProvider = ProjectPdfThumbnailFamily._();

final class ProjectPdfThumbnailProvider extends $FunctionalProvider<
        AsyncValue<List<Uint8List>>, List<Uint8List>, FutureOr<List<Uint8List>>>
    with $FutureModifier<List<Uint8List>>, $FutureProvider<List<Uint8List>> {
  const ProjectPdfThumbnailProvider._(
      {required ProjectPdfThumbnailFamily super.from,
      required List<String> super.argument})
      : super(
          retry: null,
          name: r'projectPdfThumbnailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectPdfThumbnailHash();

  @override
  String toString() {
    return r'projectPdfThumbnailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Uint8List>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Uint8List>> create(Ref ref) {
    final argument = this.argument as List<String>;
    return projectPdfThumbnail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectPdfThumbnailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectPdfThumbnailHash() =>
    r'48c7d1c5039a1716fbffe398f3bbc798fad352c0';

final class ProjectPdfThumbnailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Uint8List>>, List<String>> {
  const ProjectPdfThumbnailFamily._()
      : super(
          retry: null,
          name: r'projectPdfThumbnailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ProjectPdfThumbnailProvider call(
    List<String> pdfPaths,
  ) =>
      ProjectPdfThumbnailProvider._(argument: pdfPaths, from: this);

  @override
  String toString() => r'projectPdfThumbnailProvider';
}
