import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {

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

  static bool shouldExitApp() {
    var lastExitTime = DateTime.now();
    if (DateTime.now().difference(lastExitTime) >= const Duration(seconds: 2)) {
      lastExitTime = DateTime.now();
      TToastMessages.infoToast('Press the back button again to exit');
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

  static void goBack() {
    Get.back<void>();
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

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
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

  static Future<String> getLocation(RxBool isLoading) async {
    var location = '';
    try {
      isLoading.value = true;
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
        await getLocation(isLoading);
        isLoading.value = false;
        return location;
      } else {
        final position = await Geolocator.getCurrentPosition();
        final placeMarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        final placeMark = placeMarks[0];
        location =
            '${placeMark.subAdministrativeArea}, '
            '${placeMark.administrativeArea} state, '
            '${placeMark.country}.';
        isLoading.value = false;
      }
    } catch (_) {
      TToastMessages.infoToast('Unable to get current location data',);
      isLoading.value = false;
    }
    return location;
  }

  static String getFileSize(File file){
    return (file.lengthSync() / (1024 * 1024)).toStringAsFixed(1);
  }

  static String redactString(String original, int redactLength, {int start = 3}) {
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

}
