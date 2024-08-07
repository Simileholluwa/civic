
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

extension AppFilledButton on FilledButton {
  Widget withLoading({
    required bool loading,
  }) {
    return loading
        ? SizedBox(
            width: double.infinity,
            height: 60,
            child: FilledButton(
              onPressed: null,
              child: LoadingAnimationWidget.prograssiveDots(
                color: TColors.primary,
                size: 50,
              ),
            ),
          )
        : SizedBox(
            width: double.infinity,
            height: 60,
            child: this,
          );
  }
}
