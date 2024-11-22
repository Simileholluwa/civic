import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProjectLocationOptions extends StatelessWidget {
  const ProjectLocationOptions({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final VoidCallback? onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            TSizes.sm,
          ),
          color: Theme.of(context).splashColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: TColors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17,
                      color: TColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
