// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentDoubleButton extends StatelessWidget {
  const ContentDoubleButton({
    super.key,
    required this.firstButtonOnPressed,
    required this.secondButtonOnPressed,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.secondButtonColor,
    required this.firstButtonIcon,
    required this.secondButtonIcon,
  });

  final VoidCallback? firstButtonOnPressed;
  final VoidCallback? secondButtonOnPressed;
  final String firstButtonText;
  final String secondButtonText;
  final Color secondButtonColor;
  final IconData firstButtonIcon;
  final IconData secondButtonIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: firstButtonOnPressed,
              label: Text(
                firstButtonText,
              ),
              icon: Icon(
                firstButtonIcon,
                color: TColors.textWhite,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.primary,
                foregroundColor: TColors.textWhite,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: secondButtonOnPressed,
              label: Text(
                secondButtonText,
              ),
              icon: Icon(
                secondButtonIcon,
                color: TColors.textWhite,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondButtonColor,
                foregroundColor: TColors.textWhite,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
