import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'integer_provider.g.dart';

@riverpod
class PageChanged extends _$PageChanged {
  @override
  int build() => 0;

  void carouselPageChanged(int index, dynamic reason) {
    state = index;
  }
}

@riverpod
class VettingImagePageChanged extends _$VettingImagePageChanged {
  @override
  int build() => 0;

  void carouselPageChanged(int index, dynamic reason) {
    state = index;
  }
}

@riverpod
class ProjectImageAttachmentPageChanged
    extends _$ProjectImageAttachmentPageChanged {
  @override
  int build() => 0;

  void carouselPageChanged(int index, dynamic reason) {
    state = index;
  }
}

@riverpod
class ProjectPDFAttachmentPageChanged
    extends _$ProjectPDFAttachmentPageChanged {
  @override
  int build() => 0;

  void carouselPageChanged(int index, dynamic reason) {
    state = index;
  }
}

@Riverpod(keepAlive: true)
class NotificationsCount extends _$NotificationsCount {
  @override
  int build() => 0;

  set count(int count) {
    state = count;
  }
}
