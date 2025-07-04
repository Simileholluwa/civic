import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({
    super.key,
    this.errorMessage,
    required this.retry,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.imageString = TImageTexts.disconnected,
    this.mainAxisAlignment,
    this.showRefresh = false,
  });

  final String? errorMessage;
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
        spacing: 10,
        children: [
          Text(
            'OOPS!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            errorMessage ?? 'Something went wrong while fetching requested data. Please try again.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).hintColor,
            ),
            textAlign: TextAlign.center,
          ),
          if(showRefresh)
            SizedBox(
              height: 1,),
          if (showRefresh)
            SizedBox(
              height: 45,
              width: 250,
              child: ContentSingleButton(
                onPressed: retry,
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
                ),
              
            ),
        ],
      ),
    );
  }
}
