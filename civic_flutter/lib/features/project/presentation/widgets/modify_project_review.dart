import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ModifyProjectReview extends StatelessWidget {
  const ModifyProjectReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 250,
            image: AssetImage(
              TImageTexts.completed,
            ),
          ),
          Text(
            'You have already reviewed this project. You can make changes to your review below.',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
