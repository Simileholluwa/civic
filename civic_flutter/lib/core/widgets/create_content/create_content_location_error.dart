
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateContentLocationError extends StatelessWidget {
  const CreateContentLocationError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Unable to find a place associated with your current location. Please try again or use the search button.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Consumer(builder: (context, ref, _) {
            return TextButton.icon(
              onPressed: () {
                ref.invalidate(searchNearbyPlacesProvider);
                ref.invalidate(searchPlacesProvider);
              },
              label: const Text(
                'Retry',
              ),
              icon: const Icon(
                Icons.refresh_rounded,
              ),
            );
          }),
        ],
      ),
    );
  }
}
