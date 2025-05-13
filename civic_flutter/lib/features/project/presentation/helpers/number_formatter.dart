import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##0.##");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all commas
    final cleanedText = newValue.text.replaceAll(',', '');

    // Try parsing as double to allow decimals
    final double? value = double.tryParse(cleanedText);
    if (value == null) {
      return oldValue; // Invalid number
    }

    final newFormatted = numberFormat.format(value);

    // Calculate new selection offset
    final int newOffset =
        newFormatted.length - (cleanedText.length - newValue.selection.end);

    return TextEditingValue(
      text: newFormatted,
      selection: TextSelection.collapsed(
        offset: newOffset.clamp(0, newFormatted.length),
      ),
    );
  }
}
