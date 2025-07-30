import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class CreateContentItems extends StatelessWidget {
  const CreateContentItems({
    super.key,
    required this.itemName,
    required this.icon,
    required this.onTap,
    required this.itemCaption,
    this.textColor,
  });

  final IconData icon;
  final String itemCaption;
  final String itemName;
  final VoidCallback? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 15,
            children: [
              Icon(
                icon,
                color: textColor ?? TColors.primary,
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: textColor,
                          ),
                    ),
                    Text(
                      itemCaption,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15,
                            color: textColor,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
