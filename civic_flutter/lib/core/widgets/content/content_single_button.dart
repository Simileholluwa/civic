// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentSingleButton extends StatelessWidget {
  const ContentSingleButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonIcon,
    this.color = TColors.primary,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData buttonIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text,
        ),
        icon: Icon(
          buttonIcon,
          color: TColors.textWhite,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: TColors.textWhite,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
