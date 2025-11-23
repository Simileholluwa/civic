import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShareOpinion extends ConsumerWidget {
  const ShareOpinion({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRecord = ref.read(localStorageProvider).getString('userRecord')!;
    final record =
        UserRecord.fromJson(jsonDecode(userRecord) as Map<String, dynamic>)
            .userInfo!;
    final imageUrl = record.imageUrl!;
    final username = record.userName!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          spacing: 15,
          children: [
            AppUserProfileImage(
              imageUrl: imageUrl,
              radius: 23,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 2,
              ),
              child: Text('$username, share your opinion...'),
            ),
          ],
        ),
      ),
    );
  }
}
