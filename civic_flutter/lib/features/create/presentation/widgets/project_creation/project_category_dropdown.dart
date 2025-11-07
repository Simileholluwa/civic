import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ProjectCategoryDropdown extends StatelessWidget {
  const ProjectCategoryDropdown({
    required this.dropdownItems,
    required this.value,
    required this.onChanged,
    required this.hintText,
    super.key,
    this.width = double.maxFinite,
    this.rightPadding = 16,
    this.leftPadding = 8,
  });

  final List<String> dropdownItems;
  final String? value;
  final void Function(String?)? onChanged;
  final String hintText;
  final double width;
  final double rightPadding;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    final effectiveValue = dropdownItems.contains(value) ? value : null;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            hintText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        items: ProjectHelperFunctions.addDividersAfterItems(
          dropdownItems,
          context,
        ),
        value: effectiveValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(
            right: rightPadding,
            left: leftPadding,
          ),
          height: 58,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.sm),
            border: Border.all(
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkGrey
                  : TColors.darkerGrey,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(
            0,
            -10,
          ),
          maxHeight: 400,
          elevation: 0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          customHeights: ProjectHelperFunctions.getCustomItemsHeights(
            dropdownItems,
          ),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(
            Icons.arrow_drop_up,
            color: TColors.primary,
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: TColors.primary,
          ),
        ),
      ),
    );
  }
}
