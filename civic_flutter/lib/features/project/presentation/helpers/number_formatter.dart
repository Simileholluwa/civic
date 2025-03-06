import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,###.##");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove any non-digit characters (to handle backspaces and edits)
    final cleanedValue = newValue.text.replaceAll(',', '');
    final intValue = int.tryParse(cleanedValue);

    if (intValue == null) {
      return oldValue; // Invalid input, ignore the change
    }

    final formattedValue = numberFormat.format(intValue);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
