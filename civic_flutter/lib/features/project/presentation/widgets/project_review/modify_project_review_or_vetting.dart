import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ModifyProjectReviewOrVetting extends StatelessWidget {
  const ModifyProjectReviewOrVetting({
    super.key,
    required this.information,
  });

  final String information;

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
            information,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
