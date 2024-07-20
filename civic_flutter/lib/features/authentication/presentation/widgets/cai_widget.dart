import 'package:flutter/material.dart';

class CaiWidget extends StatelessWidget {
  const CaiWidget({
    required this.letter,
    required this.meaning,
    super.key,
  });
  final String letter;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          letter,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          meaning,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}