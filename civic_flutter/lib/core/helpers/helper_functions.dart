import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/screens/choose_locations_screen.dart';
import 'package:civic_flutter/core/screens/tag_users_screen.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/request_location_permission_dialog.dart';
import 'package:civic_flutter/core/widgets/schedule_post_dialog.dart';
import 'package:civic_flutter/core/widgets/select_media_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  THelperFunctions._();

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

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
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

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
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
      DateTime? scheduledDateTimeState, List<AWSPlaces> selectedLocations) {
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
        await requestLocationPremissionDialog(context: context);
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
      builder: (context) {
        return const TagUsersScreen();
      },
    );
  }

  static Future<bool?> showScheduleDialog(
    BuildContext context,
  ) {
    return schedulePostDialog(
      context: context,
    );
  }

  static Future<bool?> showSelectMediaDialog(
    BuildContext context,
  ) {
    return showUploadMediaDialog(
      context,
    );
  }
}
