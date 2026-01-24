import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateContentSearchBar extends StatelessWidget {
  const CreateContentSearchBar({
    required this.onChanged,
    required this.trailingWidget,
    super.key,
    this.height = 50,
    this.hintText = 'Tap here to search for places',
  });

  final void Function(String) onChanged;
  final double height;
  final String hintText;
  final List<Widget> trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SearchBar(
          constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
          ),
          onChanged: onChanged,
          elevation: const WidgetStatePropertyAll(
            0,
          ),
          backgroundColor: const WidgetStatePropertyAll(
            Colors.transparent,
          ),
          hintText: hintText,
          leading: Padding(
            padding: const EdgeInsets.only(
              right: TSizes.md,
            ),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.clear,
                color: TColors.secondary,
              ),
            ),
          ),
          trailing: trailingWidget,
          hintStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          textStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.only(
              right: TSizes.xs,
            ),
          ),
        ),
      ],
    );
  }
}
