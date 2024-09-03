import 'dart:ui';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';

Future<Widget?> loadingDialog({
  required BuildContext context,
}) {
  return showDialog<Widget>(
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(
            10,
          ),
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Align(
            child: Material(
              elevation: 4,
              type: MaterialType.transparency,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    TSizes.lg,
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLoadingWidget(
                      backgroundColor: Theme.of(context).disabledColor,
                      size: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
