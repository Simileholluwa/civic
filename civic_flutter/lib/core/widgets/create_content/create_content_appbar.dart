import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateContentAppbar extends StatelessWidget {
  const CreateContentAppbar({
    super.key,
    required this.canSend,
    required this.draftData,
    required this.sendPressed,
    required this.draftPressed,
    required this.onCanSendPost,
  });

  final bool canSend;
  final List<dynamic> draftData;
  final VoidCallback sendPressed;
  final VoidCallback draftPressed;
  final VoidCallback onCanSendPost;

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
        titleSpacing: 0,
        actions: [
          Visibility(
            visible: draftData.isNotEmpty,
            child: TextButton(
              onPressed: draftPressed,
              child: Text(
                'DRAFTS',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: TColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Visibility(
            visible: draftData.isNotEmpty,
            child: const SizedBox(
              height: 20,
              child: VerticalDivider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: TextButton(
              onPressed: !canSend ? null : sendPressed,
              child: Text(
                'SEND',
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
