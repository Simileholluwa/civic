import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class CreateContentDraftsAppbar extends StatelessWidget {
  const CreateContentDraftsAppbar({
    required this.actionPressed,
    required this.data,
    required this.leadingPressed,
    super.key,
  });

  final VoidCallback actionPressed;
  final List<dynamic> data;
  final VoidCallback leadingPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: TSizes.sm - 2,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: leadingPressed,
          icon: const Icon(
            Icons.clear,
          ),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: TextButton(
              onPressed: data.isEmpty ? null : actionPressed,
              child: Text(
                'DELETE ALL',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: data.isEmpty ? null : TColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
