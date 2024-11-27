import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:civic_flutter/core/core.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  static Future<bool?> showScheduleDialog(
    BuildContext context,
  ) {
    return createContentScheduleDialog(
      context: context,
    );
  }

  static void onSuggestionSelected(
    WidgetRef ref,
    String suggestion,
    MentionHashtagLinkTextEditingController controller,
  ) {
    final text = controller.text;
    final textController = controller;
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

      controller.text = newText;
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

  static void _handleMentions(WidgetRef ref, String text) {
    final selectedMentions = ref.watch(
      selectedMentionsProvider,
    );
    List<String> currentMentions = ref.watch(
      extractedMentionsProvider(text),
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

  static String _getLastWord(
    WidgetRef ref,
    String text,
    MentionHashtagLinkTextEditingController controller,
  ) {
    final cursorIndex = controller.selection.baseOffset;
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
    MentionHashtagLinkTextEditingController controller,
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
      final lastWord = _getLastWord(ref, text, controller,);
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
    _handleMentions(ref, text);
  }
 
}
