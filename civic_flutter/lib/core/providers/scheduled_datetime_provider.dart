import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scheduled_datetime_provider.g.dart';

@Riverpod(keepAlive: true)
class PostScheduledDateTime extends _$PostScheduledDateTime {
  @override
  DateTime? build() => null;

  void setDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      state = dateTime;
    } else {
      state = null;
    }
  }

  void clearDateTime() {
    state = null;
    ref.invalidateSelf();
  }

  String formatDate() {
    if (state != null) {
      return DateFormat('MMM d, y').format(state!);
    }

    return '';
  }

  String formatTime() {
    if (state != null) {
      return DateFormat('h:mma').format(state!);
    }
    return '';
  }

  String humanizeDateTime() {
    return '${TTexts.scheduledFor} ${formatDate()} ${TTexts.at} ${formatTime()}.';
  }

  String humanizeDateTimeForSend() {
    return '${formatDate()} ${TTexts.at} ${formatTime()}';
  }

  bool canSendLater() {
    if (state != null) {
      if (state!.isAfter(DateTime.now())) return true;
      return false;
    }
    return false;
  }

  TextEditingController textController() {
    final controller = TextEditingController(
      text:
          state == null ? null : '${formatDate()} ${TTexts.at} ${formatTime()}',
    );
    return controller;
  }
}
