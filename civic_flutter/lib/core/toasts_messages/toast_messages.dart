import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class TToastMessages {
  TToastMessages._();

  static ToastificationItem errorToast(
    String message, {
    int closeDuration = 5,
  }) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: Duration(
        seconds: closeDuration,
      ),
      margin: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.md,
        bottom: TSizes.md,
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }

  static ToastificationItem infoToast(
    String message, {
    int closeDuration = 5,
  }) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: Duration(
        seconds: closeDuration,
      ),
      margin: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.md,
        bottom: TSizes.md,
      ),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    );
  }

  static ToastificationItem successToast(
    String message, {
    int closeDuration = 5,
  }) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: Duration(
        seconds: closeDuration,
      ),
      margin: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.md,
        bottom: TSizes.md,
      ),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    );
  }

  static ToastificationItem warningToast(
    String message, {
    int closeDuration = 5,
  }) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      margin: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.md,
        bottom: TSizes.md,
      ),
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      autoCloseDuration: Duration(
        seconds: closeDuration,
      ),
    );
  }
}
