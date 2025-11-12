import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

/// TextEditingController that highlights @mentions, #hashtags and links.
///
/// Improvements over the previous version:
/// - Robust tokenization (mentions/hashtags only highlighted at word start)
/// - Better URL detection (http/https/www)
/// - Handles IME composing region to avoid flicker while typing
/// - Single-pass builder with clear boundaries and fewer allocations
class MentionHashtagLinkTextEditingController extends TextEditingController {
  MentionHashtagLinkTextEditingController({super.text});

  // Precompiled token regex: mentions, hashtags, or links
  // - Mentions: @username (letters, numbers, underscore, dot)
  // - Hashtags: #tag (letters, numbers, underscore)
  // - Links: http(s)://... or www....
  static final RegExp _tokenRegExp = RegExp(
    r'(?:@[A-Za-z0-9_\.]+)|(?:#[A-Za-z0-9_]+)|(?:(?:https?:\/\/|www\.)\S+)',
    caseSensitive: false,
  );

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    required bool withComposing,
    TextStyle? style,
  }) {
    // Fast-path: nothing to parse
    final fullText = text;
    if (fullText.isEmpty) {
      return TextSpan(text: '', style: style);
    }

    // Respect composing region: avoid styling the active IME composition
    final composing = withComposing && value.isComposingRangeValid
        ? value.composing
        : TextRange.empty;

    if (!composing.isValid || composing.isCollapsed) {
      // No composing: parse whole string
      return TextSpan(
        children: _buildSpansForRange(
          fullText,
          0,
          fullText.length,
          style,
        ),
        style: style,
      );
    }

    // Split into [before | composing | after]. Only style before/after.
    final before = _buildSpansForRange(
      fullText,
      0,
      composing.start,
      style,
    );
    final composingSpan = TextSpan(
      text: fullText.substring(
        composing.start,
        composing.end,
      ),
      style: style,
    );
    final after = _buildSpansForRange(
      fullText,
      composing.end,
      fullText.length,
      style,
    );

    return TextSpan(
      children: [
        ...before,
        composingSpan,
        ...after,
      ],
      style: style,
    );
  }

  List<InlineSpan> _buildSpansForRange(
    String source,
    int start,
    int end,
    TextStyle? baseStyle,
  ) {
    final spans = <InlineSpan>[];
    if (start >= end) return spans;

    final segment = source.substring(start, end);
    final matches = _tokenRegExp.allMatches(segment);
    var index = 0;

    for (final m in matches) {
      final mStart = m.start;
      final mEnd = m.end;

      if (mStart > index) {
        spans.add(
          TextSpan(
            text: segment.substring(index, mStart),
            style: baseStyle,
          ),
        );
      }

      final token = segment.substring(mStart, mEnd);

      // Only highlight mentions/hashtags when they start a word (start or preceded by whitespace)
      final globalStart = start + mStart;
      final precededByWhitespace = globalStart == 0 ||
          _isWhitespace(
            source.codeUnitAt(
              globalStart - 1,
            ),
          );

      final highlighted = (baseStyle ?? const TextStyle()).copyWith(
        color: TColors.primary,
        fontWeight: FontWeight.bold,
      );

      if (token.startsWith('@') || token.startsWith('#')) {
        if (precededByWhitespace) {
          spans.add(
            TextSpan(
              text: token,
              style: highlighted,
            ),
          );
        } else {
          // Not a word start (e.g., email user@domain) -> keep as normal text
          spans.add(
            TextSpan(
              text: token,
              style: baseStyle,
            ),
          );
        }
      } else {
        // Links are always highlighted
        spans.add(
          TextSpan(
            text: token,
            style: highlighted,
          ),
        );
      }

      index = mEnd;
    }

    if (index < segment.length) {
      spans.add(
        TextSpan(
          text: segment.substring(index),
          style: baseStyle,
        ),
      );
    }
    return spans;
  }

  bool _isWhitespace(int charCode) {
    return charCode == 0x20 /* space */ ||
        charCode == 0x0A /* \n */ ||
        charCode == 0x0D /* \r */ ||
        charCode == 0x09 /* \t */;
  }
}
