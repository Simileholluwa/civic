import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class CannotVetProjectWidget extends StatelessWidget {
  const CannotVetProjectWidget({
    required this.value, super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          const Image(
            height: 250,
            image: AssetImage(
              TImageTexts.noData,
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'You are',
              children: [
                TextSpan(
                  text: ' ${value.toStringAsFixed(
                    2,
                  )}km',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const TextSpan(
                  text: ' away from the project location. You must be within',
                ),
                TextSpan(
                  text: ' 1km',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const TextSpan(
                  text: ' to vet this project.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
