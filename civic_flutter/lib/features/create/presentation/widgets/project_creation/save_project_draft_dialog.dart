import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> saveProjectDraftDialog(
  BuildContext context,
) {
  return postDialog(
    context: context,
    title: 'Save project as draft?',
    description:
        'Would you like to save the changes you have made as draft? Previosly saved draft will be lost.',
    onTapSkipButton: () {
      context.pop(false);
    },
    activeButtonText: 'Save as draft',
    activeButtonLoading: false,
    skipButtonLoading: false,
    skipText: "Don't save",
    onTapActiveButton: () async {
      context.pop(true);
    },
  );
}
