import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextBox extends ConsumerStatefulWidget {
  const CustomTextBox({required this.post, super.key});

  final Post post;

  @override
  ConsumerState<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends ConsumerState<CustomTextBox>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(feedProvider(widget.post));
    final postNotifier = ref.watch(feedProvider(widget.post).notifier);
    final hasText = postState.controller.text.isNotEmpty;
    final isComment = widget.post.postType == PostType.regular ||
        widget.post.postType == PostType.projectRepost ||
        widget.post.postType == PostType.poll ||
        widget.post.postType == PostType.article;

    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 5, 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 40,
                          maxHeight: 200,
                        ),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            controller: postState.controller,
                            decoration: const InputDecoration(
                              hintText: 'Share your thoughts...',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(3, 3, 0, 3),
                              errorStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.red,
                              ),
                              errorMaxLines: 2,
                            ),
                            validator: (value) {
                              if (value != null) {
                                if (value.length > 400) {
                                  return 'Maximum length of 400 characters '
                                      'exceeded.';
                                }
                              }
                              return null;
                            },
                            minLines: 1,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                    child: !hasText
                        ? IconButton(
                            icon: const Icon(
                              Iconsax.gallery5,
                            ),
                            onPressed: () {},
                          )
                        : const SizedBox.shrink(),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.open_in_full_rounded,
                    ),
                    onPressed: () async {
                      await context.push(
                        '/create/post/0',
                        extra: {
                          'parent': widget.post,
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            child: hasText
                ? Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: const BoxDecoration(
                      color: TColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: TColors.white,
                      ),
                      onPressed: () async {
                        isComment
                            ? await postNotifier.sendComment(
                                widget.post.id!,
                                null,
                              )
                            : await postNotifier.sendReply(
                                widget.post.id!,
                                null,
                              );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
