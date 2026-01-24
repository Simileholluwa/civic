import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';

class ReactToReviewOrVetting extends StatelessWidget {
  const ReactToReviewOrVetting({
    required this.text,
    required this.likesCount,
    required this.likeTextColor,
    required this.dislikeTextColor,
    required this.likeTapped,
    required this.dislikeTapped,
    super.key,
    this.onDelete,
    this.isOwner = false,
  });

  final String text;
  final int likesCount;
  final Color likeTextColor;
  final Color dislikeTextColor;
  final VoidCallback likeTapped;
  final VoidCallback dislikeTapped;
  final bool isOwner;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Theme.of(context).cardColor,
        ),
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
            ),
            Row(
              children: [
                ProjectVetButton(
                  title: THelperFunctions.humanizeNumber(
                    likesCount,
                  ),
                  icon: Icons.thumb_up_rounded,
                  backgroundColor: Colors.transparent,
                  textColor: likeTextColor,
                  isApprove: true,
                  iconSize: 20,
                  fontSize: 18,
                  onTap: likeTapped,
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(),
                ),
                ProjectVetButton(
                  title: '',
                  icon: Icons.thumb_down_rounded,
                  backgroundColor: Colors.transparent,
                  textColor: dislikeTextColor,
                  isDisapprove: true,
                  iconSize: 20,
                  onTap: dislikeTapped,
                ),
                if (isOwner)
                  Row(
                    children: [
                      const SizedBox(
                        height: 35,
                        child: VerticalDivider(),
                      ),
                      ProjectVetButton(
                        title: '',
                        icon: Icons.delete_forever,
                        backgroundColor: Colors.transparent,
                        textColor: Colors.red,
                        isDisapprove: true,
                        iconSize: 20,
                        onTap: onDelete,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
