import 'package:civic_flutter/core/helpers/helper_functions.dart';

class TValidator {
  TValidator._();
  static String? validateEmptyText(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateUsername(String? value, List<String> usernames) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    if (value.length < 3 || value.length > 12) {
      return 'Input 3 to 15 characters';
    }

    if (usernames.contains(
      THelperFunctions.capitalizeFirst(
        value.trim(),
      ),
    )) {
      return 'Username already exists. Please choose a different username.';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty || password == null) {
      return 'Confirm your password';
    }

    if (value.trim() != password.trim()) {
      return 'Password does not match';
    }

    return null;
  }

  static DateTime convertStringToDate(String dateString) {
    final dateParts = dateString.split('/');

    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    return DateTime(year, month, day);
  }

  static String? validateStartDate(String? value) {
    final currentDate = DateTime.now();
    if (value == null || value.isEmpty) {
      return 'Start date is required.';
    }

    if (convertStringToDate(value).isAfter(currentDate)) {
      return 'Start date can not be in the future';
    }

    return null;
  }

  static String? validateEndDate(String? value, String start) {
    var startDate = DateTime.now();
    final currentDate = DateTime.now();
    if (value == null || value.isEmpty) {
      return 'End date is required.';
    }

    if (start.isEmpty) {
      return 'Select project start date';
    }

    if (start.isNotEmpty) {
      startDate = convertStringToDate(start);
    }

    if (convertStringToDate(value).isBefore(currentDate)) {
      return 'End date can not be in the past';
    }

    if (convertStringToDate(value).isBefore(startDate)) {
      return 'End date can not be before start date';
    }

    if (convertStringToDate(value).isAtSameMomentAs(currentDate)) {
      return 'End date can not be the same as current date';
    }

    if (convertStringToDate(value).isAtSameMomentAs(startDate)) {
      return 'End date can not be the same as start date';
    }

    return null;
  }

  static String? validateNin(String? value) {
    if (value == null || value.isEmpty) {
      return 'NIN is required.';
    }

    if (value.length != 11) {
      return 'NIN is 11 digits long';
    }

    return null;
  }

  static String? validateProjectLink(String? value) {
    final urlPattern = RegExp(
      r'^(ftp:\/\/|www\.|ftp\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+(\S*)$',
    );

    if (value == null || value.isEmpty) {
      return 'URL is required';
    }

    if (!urlPattern.hasMatch(value)) {
      return 'Invalid url';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter 6 digit code to continue';
    }

    if (value.length < 6) {
      return 'Enter 6-digit code';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp('[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp('[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
