import 'package:flutter/material.dart';

class ArticleTextEditingController extends TextEditingController {

  // Keep track of text styles in a map
  final Map<int, TextStyle> _styleMap = {};

  // Method to apply style to a selected range
  void applyStyle(TextStyle style, int start, int end) {
    for (var i = start; i < end; i++) {
      _styleMap[i] = style;
    }
    notifyListeners(); // Update the UI
  }

  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  bool isBigText = false;
  bool isLargeText = false;
  bool isBlockquote = false;
  bool isOrderedList = false;
  bool isUnorderedList = false;
  bool isTab = false;

  int listIndex = 1; // To track ordered list index

  // Function to toggle bold format
  void toggleBold() {
    isBold = !isBold;
    notifyListeners();
  }

  // Function to toggle large text
  void toggleLargeText() {
    isLargeText = !isLargeText;
    notifyListeners();
  }

  // Function to toggle large text
  void toggleBigText() {
    isBigText = !isBigText;
    notifyListeners();
  }

  // Function to toggle italic format
  void toggleItalic() {
    isItalic = !isItalic;
    notifyListeners();
  }

  // Function to toggle underline format
  void toggleUnderline() {
    isUnderline = !isUnderline;
    notifyListeners();
  }

  // Function to toggle blockquote format
  void toggleBlockquote() {
    isBlockquote = !isBlockquote;
    notifyListeners();
  }

  // Function to toggle unordered list
  void toggleUnorderedList() {
    isUnorderedList = !isUnorderedList;
    notifyListeners();
  }

  // Function to toggle ordered list
  void toggleOrderedList() {
    isOrderedList = !isOrderedList;
    listIndex = 1; // Reset index on toggle
    notifyListeners();
  }

  // Function to insert a tab (indent)
  void insertTab() {
    isTab = true;
    notifyListeners();
  }

  // Function to detect and apply formatting
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    required bool withComposing, TextStyle? style,
  }) {
    final spans = <TextSpan>[];

    // Iterate over the text and apply styles
    for (var i = 0; i < text.length; i++) {
      spans.add(TextSpan(
        text: text[i],
        style: _styleMap[i] ?? style, // Apply style if available
      ),);
    }

    return TextSpan(children: spans);
  }
}
