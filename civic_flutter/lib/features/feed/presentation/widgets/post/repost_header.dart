import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class RepostHeader extends ConsumerWidget {
  const RepostHeader({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = post.ownerId == userId;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Icon(Iconsax.repeate_music, color: theme.hintColor, size: 18,),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              isOwner ? 'You reposted' :
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
