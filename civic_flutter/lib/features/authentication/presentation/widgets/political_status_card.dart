import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/authentication/domain/entities/political_status_card_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class PoliticalStatusOptions extends GetView<AuthController> {
  const PoliticalStatusOptions({
    required this.politicalStatusCardEntity,
    super.key,
  });
  final PoliticalStatusCardEntity politicalStatusCardEntity;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            TSizes.borderRadiusLg,
          ),
          border: Border.all(
            color: controller.state.selectedPoliticalStatus.value ==
                    politicalStatusCardEntity.politicalStatus
                ? TColors.primary
                : Theme.of(context).dividerColor,
          ),
        ),
        child: ListTile(
          onTap: () {
            controller.state.selectedPoliticalStatus.value =
                politicalStatusCardEntity.politicalStatus;
          },
          title: Row(
            children: [
              SizedBox(
                height: 24,
                width: 18,
                child: Radio<PoliticalStatus>(
                  value: politicalStatusCardEntity.politicalStatus,
                  groupValue: controller.state.selectedPoliticalStatus.value,
                  onChanged: (value) {
                    controller.state.selectedPoliticalStatus.value = value!;
                  },
                ),
              ),
              const SizedBox(
                width: TSizes.md,
              ),
              Text(
                politicalStatusCardEntity.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          subtitle: Text(
            politicalStatusCardEntity.subTitle,
            style: Theme.of(context).textTheme.labelLarge!,
          ),
        ),
      ),
    );
  }
}
