import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> postDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onTapSkipButton,
  required String activeButtonText,
  required bool activeButtonLoading,
  required bool skipButtonLoading,
  required VoidCallback onTapActiveButton,
  required String skipText,
}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(
            bottom: 16,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      onTap: context.pop,
                      child: const Icon(
                        Icons.clear,
                        color: TColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30,
                  children: [
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                    AppDualButton(
                      onTapActiveButton: onTapActiveButton,
                      activeButtonText: activeButtonText,
                      activeButtonLoading: activeButtonLoading,
                      onTapSkipButton: onTapSkipButton,
                      skipButtonLoading: skipButtonLoading,
                      skipText: skipText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },);
}
