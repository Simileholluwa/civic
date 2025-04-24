import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectLoadingError extends ConsumerWidget {
  const ProjectLoadingError({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Image(
            height: 250,
            image: AssetImage(
              TImageTexts.noData,
            ),
          ),
          Text(
            "Something went wrong while tring to load this project. Please try again.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              ref.invalidate(projectDetailProvider);
            },
            child: Text(
              'Refresh',
            ),
          ),
        ],
      ),
    );
  }
}
