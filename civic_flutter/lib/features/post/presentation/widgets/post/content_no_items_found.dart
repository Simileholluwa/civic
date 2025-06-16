import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentNoItemsFound extends StatelessWidget {
  const ContentNoItemsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.messages,
            size: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Be the first to share your opinion!",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
