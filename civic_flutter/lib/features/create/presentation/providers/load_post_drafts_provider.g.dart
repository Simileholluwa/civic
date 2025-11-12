// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_post_drafts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loaddraftPost)
const loaddraftPostProvider = LoaddraftPostFamily._();

final class LoaddraftPostProvider extends $FunctionalProvider<
        AsyncValue<List<Post>>, List<Post>, FutureOr<List<Post>>>
    with $FutureModifier<List<Post>>, $FutureProvider<List<Post>> {
  const LoaddraftPostProvider._(
      {required LoaddraftPostFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'loaddraftPostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loaddraftPostHash();

  @override
  String toString() {
    return r'loaddraftPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Post>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Post>> create(Ref ref) {
    final argument = this.argument as String;
    return loaddraftPost(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoaddraftPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loaddraftPostHash() => r'61da5cf6ab0fb32e21750bd9289d08c79dec278d';

final class LoaddraftPostFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Post>>, String> {
  const LoaddraftPostFamily._()
      : super(
          retry: null,
          name: r'loaddraftPostProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LoaddraftPostProvider call(
    String draftType,
  ) =>
      LoaddraftPostProvider._(argument: draftType, from: this);

  @override
  String toString() => r'loaddraftPostProvider';
}
