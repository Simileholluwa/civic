import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class SelectVerificationMethod extends StatefulWidget {
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
  State<SelectVerificationMethod> createState() =>
      _SelectVerificationMethodState();
}

class _SelectVerificationMethodState extends State<SelectVerificationMethod> {
  var _verificationMethod = 0;
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
          leading: Radio<int>(
              value: widget.value,
              groupValue: _verificationMethod,
              onChanged: (value) {
                setState(() {
                  _verificationMethod = value!;
                });
              },
            ),
          
          onTap: () {
            _verificationMethod = widget.value;
          },
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            widget.subTitle,
          ),
        ),
      ),
    );
  }
}
