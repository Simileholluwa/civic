import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class RepostHeader extends StatelessWidget {
  const RepostHeader({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          AppUserProfileImage(
            imageUrl: post.owner!.userInfo!.imageUrl!,
            radius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              '${THelperFunctions.getFullName(
                post.owner!.firstName!,
                post.owner!.middleName,
                post.owner!.lastName!,
              )} reposted',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
