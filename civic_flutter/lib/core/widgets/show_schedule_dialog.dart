import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/widgets/schedule_post_dialog.dart';
import 'package:civic_flutter/features/post/presentation/widgets/pick_date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showScheduleDialog(
    BuildContext context,
    PostScheduledDateTime scheduledDateTimeProvider,
  ) {
    return schedulePostDialog(
      context: context,
      title: 'Schedule post',
      description: 'Scheduled post will be sent at the'
          ' selected date and time.',
      textController: scheduledDateTimeProvider.textController(),
      onTextFieldTapped: () async {
        context.pop();
        scheduledDateTimeProvider.setDateTime(
          await pickDateAndTime(context),
        );
      },
      onTapActiveButton: null,
    );
  }