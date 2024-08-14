import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class TToastMessages {
  TToastMessages._();

  static ToastificationItem errorToast(
    String message,
    BuildContext context,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
    );
  }

  static ToastificationItem infoToast(
    String message,
    BuildContext context,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      type: ToastificationType.info,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
    );
  }

  static ToastificationItem successToast(
    String message,
    BuildContext context,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
    );
  }

  static ToastificationItem warningToast(
    String message,
    BuildContext context,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      type: ToastificationType.warning,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
    );
  }
}
