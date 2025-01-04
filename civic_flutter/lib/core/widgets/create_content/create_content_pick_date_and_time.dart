import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

Future<DateTime?> createContentpickDateAndTime(BuildContext context) async {
  final isDark = THelperFunctions.isDarkMode(context);

  final pickedDate = await showDatePicker(
    context: context,
    switchToInputEntryModeIcon: const Icon(
      Icons.add,
      color: Colors.transparent,
    ),
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(
        days: 6,
      ),
    ),
    helpText: 'Select scheduled date',
    builder: (context, child) {
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
        child: child!,
      );
    },
  );
  if (pickedDate != null) {
    final pickedTime = await showTimePicker(
      // ignore: use_build_context_synchronously
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Select scheduled time',
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: Theme.of(context!).copyWith(
            timePickerTheme: TimePickerThemeData(
              dialBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 4,
              entryModeIconColor: Colors.transparent,
              backgroundColor: isDark ? TColors.dark : TColors.light,
            ),
            dialogTheme: const DialogTheme(
              elevation: 10,
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
            ),
            child: child!,
          ),
        );
      },
    );
    if (pickedTime != null) {
      final dateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      if (dateTime.isBefore(
        DateTime.now(),
      )) {
        TToastMessages.infoToast(
          'Scheduled time cannot be in the past',
        );
        return null;
      }

      return dateTime;
    }
    TToastMessages.infoToast(
      'Select the scheduled time.',
    );
    return null;
  }
  TToastMessages.infoToast(
    'Select the scheduled date and time.',
  );
  return null;
}
