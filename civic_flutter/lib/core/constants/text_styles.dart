import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTextStyles {
  TTextStyles._();

  static TextStyle hintStyle =
      Theme.of(Get.context!).textTheme.labelMedium!.copyWith(
            color: Theme.of(Get.context!).hintColor,
          );

  static TextStyle userNameStyle =
      Theme.of(Get.context!).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w700,
          );

  static TextStyle projectTitle = Theme.of(Get.context!)
      .textTheme
      .titleMedium!
      .copyWith(fontWeight: FontWeight.bold);
}
