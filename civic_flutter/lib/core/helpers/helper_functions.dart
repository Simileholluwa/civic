import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/screens/choose_locations_screen.dart';
import 'package:civic_flutter/core/screens/tag_users_screen.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_dialog.dart';
import 'package:civic_flutter/core/widgets/app/app_request_location_permission_dialog.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_schedule_dialog.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_select_media_dialog.dart';
import 'package:civic_flutter/features/poll/presentation/pages/poll_drafts_screen.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_draft_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/pages/post_drafts_screen.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_send_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  THelperFunctions._();

  static Timer? _debounce;

  static const colorizeColors = [
    TColors.primary,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static Widget animatedText(
    String text,
    TextStyle textStyle,
    TextAlign textAlign,
  ) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(
        milliseconds: 20,
      ),
      animatedTexts: [
        ColorizeAnimatedText(
          text,
          textStyle: textStyle,
          colors: colorizeColors,
          textAlign: textAlign,
        ),
      ],
    );
  }

  static bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  static bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  static PostType determinePostType({
    required String text,
    required List<String> pickedImages,
    required String pickedVideo,
  }) {
    if (pickedVideo.isNotEmpty && text.isNotEmpty) {
      return PostType.textWithVideo;
    } else if (pickedVideo.isNotEmpty) {
      return PostType.video;
    } else if (pickedImages.isNotEmpty &&
        pickedImages.length > 1 &&
        text.isNotEmpty) {
      return PostType.textWithImages;
    } else if (pickedImages.isNotEmpty && pickedImages.length > 1) {
      return PostType.images;
    } else if (pickedImages.isNotEmpty &&
        pickedImages.length == 1 &&
        text.isNotEmpty) {
      return PostType.textWithImage;
    } else if (pickedImages.isNotEmpty && pickedImages.length == 1) {
      return PostType.image;
    } else if (text.isNotEmpty) {
      return PostType.text;
    } else {
      return PostType.none;
    }
  }

  static String humanizeNumber(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }

  static double getWidth(BuildContext context) {
    final window = View.of(context);
    final pixelRatio = window.devicePixelRatio;
    return (window.physicalSize / pixelRatio).width;
  }

  static double getHeight(BuildContext context) {
    final window = View.of(context);
    final pixelRatio = window.devicePixelRatio;
    return (window.physicalSize / pixelRatio).height;
  }

  static bool shouldExitApp(BuildContext context) {
    var lastExitTime = DateTime.now();
    if (DateTime.now().difference(lastExitTime) >= const Duration(seconds: 2)) {
      lastExitTime = DateTime.now();
      TToastMessages.infoToast(
        'Press the back button again to exit',
      );
      return false;
    } else {
      return true;
    }
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static bool? _isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  static bool isNull(dynamic value) => value == null;

  static bool? isBlank(dynamic value) {
    return _isEmpty(value);
  }

  static String? capitalizeFirst(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  static String getFileSize(File file) {
    return (file.lengthSync() / (1024 * 1024)).toStringAsFixed(1);
  }

  static String redactString(String original, int redactLength,
      {int start = 3}) {
    final length = original.length;
    final redactedPart = original.substring(start, length - redactLength);
    return original.replaceRange(
      start,
      length - redactLength,
      '*' * redactedPart.length,
    );
  }

  static String redactEmail(String email) {
    if (email.length <= 3) {
      return email;
    }

    final atIndex = email.indexOf('@');
    var redactedPart = '';
    for (var i = 0; i < atIndex - 3 && i < 5; i++) {
      // ignore: use_string_buffers
      redactedPart += '*';
    }

    return email.substring(0, 3) + redactedPart + email.substring(atIndex);
  }

  static double getBottomNavigationBarHeight(
    DateTime? scheduledDateTimeState,
    List<AWSPlaces> selectedLocations,
  ) {
    return scheduledDateTimeState == null && selectedLocations.isEmpty
        ? 105
        : scheduledDateTimeState == null && selectedLocations.isNotEmpty
            ? 155
            : scheduledDateTimeState != null && selectedLocations.isNotEmpty
                ? 205
                : 155;
  }

  static Future<void> selectLocation(
    BuildContext context,
  ) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TToastMessages.infoToast('Location services are disabled on your device');
    }
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await appRequestLocationPremissionDialog(context: context);
      }
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openLocationSettings();
    } else {
      if (context.mounted) {
        selectLocationBottomSheet(context: context);
      }
    }
  }

  static Future<bool?> selectLocationBottomSheet({
    required BuildContext context,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return const ChooseLocationsScreen();
      },
    );
  }

  static Future<bool?> tagUsersBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const TagUsersScreen();
      },
    );
  }

  static Future<bool?> showPostDraftsScreen(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const PostDraftsScreen();
      },
    );
  }

  static Future<bool?> showPollDraftsScreen(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return const PollDraftsScreen();
      },
    );
  }

  static Future<bool?> showScheduleDialog(
    BuildContext context,
  ) {
    return createContentScheduleDialog(
      context: context,
    );
  }

  static Future<bool?> showSelectMediaDialog(
    BuildContext context,
  ) {
    return createContentSelectMediaDialog(
      context,
    );
  }

  static void onSuggestionSelected(
    WidgetRef ref,
    String suggestion,
  ) {
    final text = ref.watch(postTextProvider).text;
    final textController = ref.watch(postTextProvider);
    final cursorIndex = textController.selection.baseOffset;

    // Find the word to replace, ensuring it's the last mention/hashtag typed
    final textBeforeCursor = text.substring(0, cursorIndex);
    final textAfterCursor = text.substring(cursorIndex);

    final lastWordMatch = RegExp(r'[@#][\w]*$').firstMatch(textBeforeCursor);
    if (lastWordMatch != null) {
      final start = lastWordMatch.start;
      final end = lastWordMatch.end;

      // Replace the mention/hashtag in the text
      final newText = textBeforeCursor.replaceRange(start, end, suggestion) +
          textAfterCursor;
      textController.text = newText;

      // Move the cursor to the end of the inserted suggestion
      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: start + suggestion.length));

      ref.read(postTextProvider).text = newText;
      ref
          .read(mentionSuggestionsProvider.notifier)
          .setSuggestions(<UserRecord>[]);
      ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
    }
  }

  static void sendPost(WidgetRef ref) async {
    final media = ref.watch(mediaProvider);
    final videoUrl = media.isEmpty
        ? ''
        : THelperFunctions.isVideo(media.first)
            ? media.first
            : '';
    final imageUrls = media.isEmpty
        ? <String>[]
        : THelperFunctions.isImage(media.first)
            ? media
            : <String>[];
    final taggedUsers = ref.watch(tagSelectionsProvider);
    await ref.read(sendPostProvider.notifier).sendPost(
          text: ref.watch(postTextProvider).text,
          imagePath: imageUrls,
          videoPath: videoUrl,
          taggedUsers: taggedUsers,
          locations: ref.watch(selectLocationsProvider),
          postType: THelperFunctions.determinePostType(
            text: ref.watch(postTextProvider).text,
            pickedImages: imageUrls,
            pickedVideo: videoUrl,
          ),
          mentions: ref.watch(selectedMentionsProvider),
          tags: ref.watch(hashtagsProvider),
        );
  }

  static void _handleMentions(WidgetRef ref) {
    final selectedMentions = ref.watch(
      selectedMentionsProvider,
    );
    List<String> currentMentions = ref.watch(
      extractedMentionsProvider,
    );

    // Remove records of users whose mentions are no longer in the text
    selectedMentions.removeWhere((
      userRecord,
    ) {
      String userName =
          userRecord.userInfo!.fullName ?? userRecord.userInfo!.userName!;
      return !currentMentions.contains(
        userName,
      );
    });
  }

  static String _getLastWord(WidgetRef ref, String text) {
    final cursorIndex = ref
        .watch(
          postTextProvider,
        )
        .selection
        .baseOffset;
    final textBeforeCursor = text.substring(
      0,
      cursorIndex,
    );
    final lastWordMatch = RegExp(
      r'[@#][\w]*$',
    ).firstMatch(
      textBeforeCursor,
    );
    return lastWordMatch?.group(
          0,
        ) ??
        '';
  }

  static Future<void> _fetchMentionSuggestions(
      WidgetRef ref, String query) async {
    final results = await ref.watch(
      fetchUsersToMentionProvider(
        query.substring(1),
      ).future,
    );

    if (results.isNotEmpty) {
      return ref
          .read(
            mentionSuggestionsProvider.notifier,
          )
          .setSuggestions(
            results,
          );
    } else {
      return ref
          .read(
        mentionSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <UserRecord>[],
      );
    }
  }

  static Future<void> _fetchHashtags(WidgetRef ref, String query) async {
    if (query.isEmpty) {
      ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
      return;
    }
    final results = await ref.watch(
      fetchHashtagsProvider(
        query.substring(
          1,
        ),
      ).future,
    );

    log(results.toString());

    if (results.isNotEmpty) {
      return ref
          .read(
            hashtagsSuggestionsProvider.notifier,
          )
          .setSuggestions(
            results,
          );
    } else {
      return ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
    }
  }

  static void onTextChanged(
    WidgetRef ref,
    String text,
  ) {
    if (text.isEmpty) {
      ref
          .read(
        mentionSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <UserRecord>[],
      );
      ref
          .read(
        hashtagsSuggestionsProvider.notifier,
      )
          .setSuggestions(
        <String>[],
      );
      return;
    }
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      final lastWord = _getLastWord(ref, text);
      if (lastWord.startsWith('@')) {
        _fetchMentionSuggestions(ref, lastWord);
      } else if (lastWord.startsWith('#')) {
        _fetchHashtags(ref, lastWord);
      } else {
        ref
            .read(mentionSuggestionsProvider.notifier)
            .setSuggestions(<UserRecord>[]);
      }
    });
    _handleMentions(ref);
  }

  static void sendPoll(
    WidgetRef ref,
  ) {
    final pollState = ref.watch(pollsOptionsProvider);
    final canSendPoll = pollState.question.isNotEmpty &&
        pollState.optionText.every((text) => text.isNotEmpty);
    if (canSendPoll) {
      ref.read(sendPollProvider.notifier).sendPollNowOrFuture(
            question: pollState.question,
            locations: ref.watch(selectLocationsProvider),
            taggedUsers: ref.watch(tagSelectionsProvider),
            mentions: ref.watch(selectedMentionsProvider),
            tags: ref.watch(hashtagsProvider),
            pollDuration: pollState.duration,
            option: ref.watch(pollsOptionsProvider).optionText,
          );
    }
  }

  static Future<bool?> deleteDraftsDialog(BuildContext context, WidgetRef ref) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(postDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
        TToastMessages.successToast('All drafts was deleted');
      },
    );
  }

  static Future<bool?> deletePollDraftsDialog(BuildContext context, WidgetRef ref) {
    return postDialog(
      context: context,
      title: 'Delete all drafts?',
      description: 'Proceed with caution as this action is '
          'irreversible.',
      onTapSkipButton: context.pop,
      activeButtonText: 'Delete all',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: 'Cancel',
      onTapActiveButton: () async {
        context.pop();
        final result =
            await ref.read(pollDraftsProvider.notifier).deleteAllDrafts();
        if (result) {
          if (context.mounted) context.pop();
        }
        TToastMessages.successToast('All drafts was deleted');
      },
    );
  }
}
