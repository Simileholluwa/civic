import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CommentRepliesPageError extends StatelessWidget {
  const CommentRepliesPageError({
    super.key,
    required this.onTap,
    required this.errorMessage,
  });

  final VoidCallback onTap;
  final String errorMessage;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.shade100,
            ),
            child: Icon(
              Iconsax.information5,
              color: Colors.red,
              size: 60,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "Retry",
            ),
          ),
        ],
      ),
    );
  }
}
