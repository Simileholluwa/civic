// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/domain/entities/political_status_card_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class PoliticalStatusOptions extends ConsumerStatefulWidget {
  const PoliticalStatusOptions({
    super.key,
    required this.email,
  });

  final String email;

  @override
  ConsumerState<PoliticalStatusOptions> createState() =>
      _PoliticalStatusOptionsState();
}

class _PoliticalStatusOptionsState
    extends ConsumerState<PoliticalStatusOptions> {
  var _currentPoliticalStatus = PoliticalStatus.none;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    ref.listen(
      authProvider,
      (_, next) {
        switch (next) {
          case AuthStateUsername():
            context.goNamed(
              AppRoutes.chooseUsername,
              pathParameters: {
                'email': next.email,
                'politicalStatus': next.politicalStatus.toString(),
              },
            );
          default:
            return;
        }
      },
    );
    return Column(
      children: [
        ListView.builder(
          itemCount: PoliticalStatus.values.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final status = allStatus[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.borderRadiusLg,
                ),
                border: Border.all(
                  color: _currentPoliticalStatus == status.politicalStatus
                      ? TColors.primary
                      : Theme.of(context).dividerColor,
                ),
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    _currentPoliticalStatus = status.politicalStatus;
                  });
                },
                title: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 18,
                      child: Radio<PoliticalStatus>(
                        value: status.politicalStatus,
                        groupValue: PoliticalStatus.values[index],
                        onChanged: (value) {
                          PoliticalStatus.values[index] = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.md,
                    ),
                    Text(
                      status.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                subtitle: Text(
                  status.subTitle,
                  style: Theme.of(context).textTheme.labelLarge!,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        FilledButton(
          onPressed: () => controller.navigateToChooseUsername(
            widget.email,
            _currentPoliticalStatus.index,
          ),
          child: const Text(
            TTexts.tContinue,
          ),
        ).withLoading(
          loading: false,
        ),
      ],
    );
  }
}
