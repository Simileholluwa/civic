import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.onChanged,
    this.height = 50,
    this.hintText = 'Search for places', required this.trailingWidget,
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
          backgroundColor: WidgetStatePropertyAll(
            THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
          ),
          hintText: hintText,
          leading: Padding(
            padding: const EdgeInsets.only(right: 8,),
            child: GestureDetector(
              onTap: context.pop,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: const Icon(
                  Icons.clear,
                ),
              ),
            ),
          ),
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
            EdgeInsets.symmetric(
              horizontal: TSizes.xs,
            ),
          ),
        ),
        Container(
          height: 43,
          width: 107,
          margin: const EdgeInsets.only(right: 3,),
          padding: const EdgeInsets.only(left: 8,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100,),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Row(
            children: trailingWidget,
          ),
        ),
      ],
    );
  }
}
