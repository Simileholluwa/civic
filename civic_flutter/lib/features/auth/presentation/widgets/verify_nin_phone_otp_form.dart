import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class VerifyNinPhoneOTPForm extends ConsumerStatefulWidget {
  const VerifyNinPhoneOTPForm({
    required this.verificationId,
    super.key,
  });

  final String verificationId;

  @override
  ConsumerState<VerifyNinPhoneOTPForm> createState() => _VerifyNinOTPState();
}

class _VerifyNinOTPState extends ConsumerState<VerifyNinPhoneOTPForm> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: _codeController,
            validator: TValidator.validateOTP,
            obscureText: true,
            obscuringWidget: const Icon(
              Icons.circle,
              size: 15,
            ),
            errorTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDark ? TColors.dark : TColors.light,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          FilledButton(
            onPressed: () {},
            child: const Text(
              'Confirm OTP',
            ),
          ).withLoading(
            loading: false,
          ),
        ],
      ),
    );
  }
}
