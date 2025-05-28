import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentAppbar extends StatelessWidget {
  const CreateContentAppbar({
    super.key,
    required this.canSend,
    required this.sendPressed,
    required this.onCanSendPost,
    this.title,
    this.sendText,
    this.isRepost = false,
  });

  final bool canSend;
  final VoidCallback sendPressed;
  final VoidCallback onCanSendPost;
  final Widget? title;
  final bool isRepost;
  final String? sendText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: canSend
              ? () => onCanSendPost()
              : () => context.pop(),
          icon: const Icon(
            Iconsax.arrow_left_2,
          ),
        ),
        title: title,
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: TextButton(
              onPressed: !canSend ? null : sendPressed,
              child: Text(
                sendText ?? 'SEND',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: !canSend
                          ? Theme.of(context).disabledColor
                          : TColors.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
