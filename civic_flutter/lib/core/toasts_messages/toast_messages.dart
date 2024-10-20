import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class TToastMessages {
  TToastMessages._();

  static ToastificationItem errorToast(
    String message,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      margin: const EdgeInsets.only(left: TSizes.md, right: TSizes.md, bottom: TSizes.md,),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }

  static ToastificationItem infoToast(
    String message,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      margin: const EdgeInsets.only(left: TSizes.md, right: TSizes.md, bottom: TSizes.md,),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    );
  }

  static ToastificationItem successToast(
    String message,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
      margin: const EdgeInsets.only(left: TSizes.md, right: TSizes.md, bottom: TSizes.md,),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    );
  }

  static ToastificationItem warningToast(
    String message,
  ) {
    return toastification.show(
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      margin: const EdgeInsets.only(left: TSizes.md, right: TSizes.md, bottom: TSizes.md,),
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
    );
  }
}
