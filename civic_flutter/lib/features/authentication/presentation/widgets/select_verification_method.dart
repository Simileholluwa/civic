import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectVerificationMethod extends GetView<AuthController> {
  const SelectVerificationMethod({
    required this.value,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final int value;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            TSizes.borderRadiusLg,
          ),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: ListTile(
          leading: Obx(
            () => Radio<int>(
              value: value,
              groupValue: controller.state.selectionVerificationMethod.value,
              onChanged: (value) {
                controller.state.selectionVerificationMethod.value = value!;
              },
            ),
          ),
          onTap: () {
            controller.state.selectionVerificationMethod.value = value;
          },
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            subTitle,
          ),
        ),
      ),
    );
  }
}
