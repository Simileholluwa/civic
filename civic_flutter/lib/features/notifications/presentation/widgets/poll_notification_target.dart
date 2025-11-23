import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class PollNotificationTarget extends StatelessWidget {
  const PollNotificationTarget({
    required this.notification,
    super.key,
  });

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContentExpandableText(
          text: notification.post!.text!,
          onToggleTextTap: () {},
        ),
        ListView.separated(
          itemCount: notification.post!.poll!.options!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, index) {
            final option = notification.post!.poll!.options![index];
            final numberOfVotes =
                notification.post!.poll!.options![index].votesCount!;
            final totalVotes = notification.post!.poll!.votesCount;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      title: Text(
                        option.option!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          totalVotes != 0
                              ? '${((numberOfVotes / totalVotes!) * 100).toStringAsFixed(
                                  2,
                                )}%'
                              : '0.00%',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                        ),
                        Text(
                          numberOfVotes == 0
                              ? 'No votes'
                              : numberOfVotes == 1
                                  ? '1 vote'
                                  : ' ${THelperFunctions.humanizeNumber(numberOfVotes)} votes',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
