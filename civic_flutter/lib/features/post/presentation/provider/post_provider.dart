import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/helpers/image_helper.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/post/presentation/state/post_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_provider.g.dart';

@riverpod
class RegularPost extends _$RegularPost {
  static final imageHelper = ImageHelper();
  static const int maxImageCount = 10;
  static const int maxVideoSizeInMb = 10;
  @override
  PostState build(Post? post) {
    if (post == null) {
      final postState = PostState.empty();
      postState.controller.addListener(
        () {
          setText(postState.controller.text);
        },
      );
      return postState;
    } else {
      final postState = PostState.populate(post);
      postState.controller.addListener(() {
        setText(postState.controller.text);
      });

      if (post.videoUrl != null) {
        if (post.videoUrl!.isNotEmpty) {
          ref.read(
            mediaVideoPlayerProvider(
              postState.videoUrl,
            ),
          );
        }
      }
      return postState;
    }
  }

  void addUser(UserRecord userRecord) {
    if (state.taggedUsers.length < 10) {
      state = state.copyWith(
        taggedUsers: [...state.taggedUsers, userRecord],
      );
    }
  }

  void removeUser(UserRecord userRecord) {
    state = state.copyWith(
      taggedUsers: state.taggedUsers
          .where((record) => record.userInfo!.id != userRecord.userInfo!.id)
          .toList(),
    );
  }

  void clearSelections() {
    state = state.copyWith(
      taggedUsers: <UserRecord>[],
    );
  }

  void addLocation(List<AWSPlaces> locations) {
    state = state.copyWith(locations: [...state.locations, ...locations]);
  }

  void removeLocation(AWSPlaces location) {
    state = state.copyWith(
      locations:
          state.locations.where((loc) => loc.place != location.place).toList(),
    );
  }

  void removeAllLocations() {
    state = state.copyWith(locations: []);
  }

  void setText(String text) {
    state = state.copyWith(text: text);
  }

  void setImages(List<String> images) {
    state = state = state.copyWith(imageUrls: images);
  }

  void setVideo(String video) {
    state = state.copyWith(videoUrl: video);
    ref.read(mediaVideoPlayerProvider(state.videoUrl));
  }

  Future<void> takeVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.takeVideo();
    if (video != null) {
      setVideo(video.path);
      setImages([]);
    }
  }

  Future<void> pickVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.pickVideo();
    if (video != null) {
      final fileSizeInBytes = await video.length();
      final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > 20) {
        TToastMessages.infoToast(
          'File size must be less than 20MB.',
        );
        return;
      }
      setVideo(video.path);
      setImages([]);
    }
  }

  Future<void> takePicture() async {
    if (state.imageUrls.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.imageUrls.length < 10) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      state = state.copyWith(
        imageUrls: [...state.imageUrls, image.path],
      );
    }
  }

  Future<void> pickPicture() async {
    if (state.imageUrls.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.imageUrls.length;
    final image = await imageHelper.pickImage(
      multipleImages: imageLength > 1 ? true : false,
    );
    if (image != null) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      var imagePaths = <String>[];
      for (final img in image) {
        imagePaths.add(img.path);
      }
      state = state.copyWith(
        imageUrls: [
          ...state.imageUrls,
          ...imagePaths.take(imageLength),
        ],
      );
      if (image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 10 images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(index) {
    var images = state.imageUrls;
    if (images.length == 1) {
      state = state.copyWith(
        imageUrls: [],
      );
    }
    images.removeAt(index);
    state = state.copyWith(
      imageUrls: [...images],
    );
  }

  bool isImage() {
    if (state.imageUrls.isNotEmpty && state.imageUrls.length == 1) {
      return true;
    }
    return false;
  }

  bool isImages() {
    if (state.imageUrls.isNotEmpty && state.imageUrls.length > 1) {
      return true;
    }
    return false;
  }

  bool isVideo() {
    if (state.videoUrl.isNotEmpty && THelperFunctions.isVideo(state.videoUrl)) {
      return true;
    }
    return false;
  }

  void clearMedia() {
    state = state.copyWith(imageUrls: []);
    state = state.copyWith(videoUrl: '');
  }

  String hintText(String username) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else {
      return "$username, what's happening in politics? Tap here to start typing.";
    }
  }
}
