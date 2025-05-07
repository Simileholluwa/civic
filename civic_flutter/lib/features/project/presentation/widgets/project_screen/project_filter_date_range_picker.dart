// ignore_for_file: use_build_context_synchronously

import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

Future<List<DateTime?>?> projectFilterDateRangePicker(
  BuildContext context,
) async {
  final startDate = await showDatePicker(
    context: context,
    switchToInputEntryModeIcon: const Icon(
      Icons.add,
      color: Colors.transparent,
    ),
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
    helpText: 'Select start date',
    builder: (context, child) {
      return DateTimeWidgetTheme(
        child: child!,
      );
    },
  );
  if (startDate != null) {
    final endDate = await showDatePicker(
      context: context,
      switchToInputEntryModeIcon: const Icon(
        Icons.add,
        color: Colors.transparent,
      ),
      firstDate: startDate.add(
        const Duration(
          days: 1,
        ),
      ),
      initialDate: startDate.add(
        const Duration(
          days: 2,
        ),
      ),
      lastDate: DateTime(2050),
      helpText: 'Select end date',
      builder: (context, child) {
        return DateTimeWidgetTheme(
          child: child!,
        );
      },
    );
    if (endDate != null) {
      return [startDate, endDate];
    }
    TToastMessages.infoToast(
      'End date was not selected.',
    );
    return null;
  }
  TToastMessages.infoToast(
    'Date range was not selected.',
  );
  return null;
}

class DateTimeWidgetTheme extends StatelessWidget {
  const DateTimeWidgetTheme({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        datePickerTheme: DatePickerThemeData(
          surfaceTintColor: Colors.transparent,
          elevation: 4,
          headerBackgroundColor: TColors.primary,
          headerForegroundColor: TColors.textWhite,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.dark
              : TColors.light,
        ),
        dialogTheme: const DialogTheme(
          elevation: 10,
        ),
      ),
      child: child,
    );
  }
}
