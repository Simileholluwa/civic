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
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
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
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
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
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      alignment: Alignment.bottomCenter,
      borderSide: const BorderSide(
        color: Colors.green,
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
      type: ToastificationType.warning,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,
      autoCloseDuration: const Duration(
        seconds: 5,
      ),
    );
  }
}
