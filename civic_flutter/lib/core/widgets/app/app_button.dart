import 'package:civic_flutter/core/core.dart';
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
              child: LoadingAnimationWidget.progressiveDots(
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

extension AppElevatedButton on ElevatedButton {
  Widget withLoading({
    required bool loading,
    Color color = TColors.primary,
  }) {
    return loading
        ? SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: null,
              child: LoadingAnimationWidget.progressiveDots(
                color: TColors.primary,
                size: 50,
              ),
            ),
          )
        : SizedBox(
            height: 50,
            child: this,
          );
  }
}
