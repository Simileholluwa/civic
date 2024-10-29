import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_appbar.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_save_post_draft_dialog.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_text_editor.dart';
import 'package:civic_flutter/features/article/presentation/widgets/article_text_toolbar.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_bottom_navigation.dart';

class CreateArticleScreen extends ConsumerStatefulWidget {
  const CreateArticleScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  ConsumerState<CreateArticleScreen> createState() =>
      _CreateArticleScreenState();
}

class _CreateArticleScreenState extends ConsumerState<CreateArticleScreen> {
  late QuillController _controller;
  late FocusNode _focusNode;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final isDark = THelperFunctions.isDarkMode(context);
    return PopScope(
      canPop: true,
      // ignore: deprecated_member_use
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
      },
      child: AppAndroidBottomNav(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: CreateContentAppbar(
              canSend: false,
              draftData: const [],
              sendPressed: () {
                context.go(
                  FeedRoutes.namespace,
                  extra: () => THelperFunctions.sendPost(ref),
                );
                ref.read(mediaVideoPlayerProvider.notifier).dispose();
              },
              onCanSendPost: () async {
                final shouldPop =
                    await createContentSavePostDraftDialog(ref, context);
                if (shouldPop ?? false) {
                  if (context.mounted) context.pop();
                }
              },
              draftPressed: () =>
                  THelperFunctions.showPostDraftsScreen(context),
            ),
          ),
          bottomNavigationBar: const CreatePostBottomNavigation(
            showSelectMedia: false,
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: ArticleTextToolbar(
                  controller: _controller,
                  focusNode: _focusNode,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                        textCapitalization: TextCapitalization.sentences,
                        
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText:
                              'Give your article a title. Keep it short and sweet.',
                          counter: SizedBox(),
                          contentPadding: EdgeInsets.all(18,),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.done,
                        maxLength: 100,
                      ),
                      ArticleTextEditor(
                        controller: _controller,
                        scrollController: _scrollController,
                        focusNode: _focusNode,
                        configurations: const QuillEditorConfigurations(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
