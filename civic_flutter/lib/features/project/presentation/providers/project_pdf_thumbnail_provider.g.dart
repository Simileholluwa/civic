// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_pdf_thumbnail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectPdfThumbnailHash() =>
    r'5bdb408a394757d7653a362bfa720ef2afb55905';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [projectPdfThumbnail].
@ProviderFor(projectPdfThumbnail)
const projectPdfThumbnailProvider = ProjectPdfThumbnailFamily();

/// See also [projectPdfThumbnail].
class ProjectPdfThumbnailFamily extends Family<AsyncValue<List<Uint8List>>> {
  /// See also [projectPdfThumbnail].
  const ProjectPdfThumbnailFamily();

  /// See also [projectPdfThumbnail].
  ProjectPdfThumbnailProvider call(
    List<String> pdfPaths,
  ) {
    return ProjectPdfThumbnailProvider(
      pdfPaths,
    );
  }

  @override
  ProjectPdfThumbnailProvider getProviderOverride(
    covariant ProjectPdfThumbnailProvider provider,
  ) {
    return call(
      provider.pdfPaths,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectPdfThumbnailProvider';
}

/// See also [projectPdfThumbnail].
class ProjectPdfThumbnailProvider
    extends AutoDisposeFutureProvider<List<Uint8List>> {
  /// See also [projectPdfThumbnail].
  ProjectPdfThumbnailProvider(
    List<String> pdfPaths,
  ) : this._internal(
          (ref) => projectPdfThumbnail(
            ref as ProjectPdfThumbnailRef,
            pdfPaths,
          ),
          from: projectPdfThumbnailProvider,
          name: r'projectPdfThumbnailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectPdfThumbnailHash,
          dependencies: ProjectPdfThumbnailFamily._dependencies,
          allTransitiveDependencies:
              ProjectPdfThumbnailFamily._allTransitiveDependencies,
          pdfPaths: pdfPaths,
        );

  ProjectPdfThumbnailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pdfPaths,
  }) : super.internal();

  final List<String> pdfPaths;

  @override
  Override overrideWith(
    FutureOr<List<Uint8List>> Function(ProjectPdfThumbnailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectPdfThumbnailProvider._internal(
        (ref) => create(ref as ProjectPdfThumbnailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pdfPaths: pdfPaths,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Uint8List>> createElement() {
    return _ProjectPdfThumbnailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectPdfThumbnailProvider && other.pdfPaths == pdfPaths;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pdfPaths.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectPdfThumbnailRef on AutoDisposeFutureProviderRef<List<Uint8List>> {
  /// The parameter `pdfPaths` of this provider.
  List<String> get pdfPaths;
}

class _ProjectPdfThumbnailProviderElement
    extends AutoDisposeFutureProviderElement<List<Uint8List>>
    with ProjectPdfThumbnailRef {
  _ProjectPdfThumbnailProviderElement(super.provider);

  @override
  List<String> get pdfPaths => (origin as ProjectPdfThumbnailProvider).pdfPaths;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
