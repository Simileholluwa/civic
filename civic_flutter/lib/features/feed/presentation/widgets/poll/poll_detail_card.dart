import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';

class PollDetailCard extends StatelessWidget {
  const PollDetailCard({
    required this.postWithUserState,
    super.key,
  });

  final PostWithUserState postWithUserState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        PollCard(
          postWithUserState: postWithUserState,
          noMaxlines: true,
        ),
        const Divider(
          height: 0,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
