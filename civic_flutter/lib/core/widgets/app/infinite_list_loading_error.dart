import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({
    super.key,
    this.errorMessage =
        'Something went wrong while fetching data. Please try again.',
    required this.retry,
    this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 0),
    this.imageString = TImageTexts.disconnected,
    this.mainAxisAlignment,
    this.showRefresh = false,
  });

  final String errorMessage;
  final VoidCallback? retry;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment? mainAxisAlignment;
  final String imageString;
  final bool showRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          Image(
            height: 250,
            image: AssetImage(
              imageString,
            ),
          ),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (showRefresh)
            const SizedBox(
              height: 20,
            ),
          if (showRefresh)
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: retry,
                child: Text(
                  'Refresh',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
