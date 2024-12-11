import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class ProjectTextWithCheckbox extends StatelessWidget {
  const ProjectTextWithCheckbox({
    super.key,
    required this.text,
    required this.index,
    required this.checkboxValue,
    required this.onChanged,
    required this.onTap,
    required this.items,
  });

  final bool checkboxValue;
  final int index;
  final List<String> items;
  final void Function(bool?) onChanged;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          0,
          15,
          2,
          17,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: checkboxValue,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: index != items.length - 1
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
