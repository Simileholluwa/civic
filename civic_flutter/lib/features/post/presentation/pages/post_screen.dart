import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/features/post/presentation/widgets/create_post_bottom_navigation.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({
    super.key,
    required this.pickedAssets,
    required this.canAddImages,
  });

  final List<XFile> pickedAssets;
  final bool canAddImages;

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return AndroidBottomNav(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            60,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(
                  Iconsax.arrow_left_2,
                ),
              ),
              titleSpacing: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: TSizes.sm,
                  ),
                  child: TextButton(
                    child: Text(
                      'POST',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: TColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CreatePostBottomNavigation(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + TSizes.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: TSizes.md,
              ),
              ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: TColors.primary,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      size: 57,
                      color: TColors.textWhite,
                    ),
                  ),
                ),
                title: Text(
                  'Ajanaku Oluwatosin Ezekiel',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20,
                        color: isDark ? TColors.textWhite : TColors.dark,
                      ),
                ),
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              TextFormField(
                controller: _textController,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      //color: Colors.transparent,
                      fontSize: 17,
                    ),
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintMaxLines: 2,
                  hintText:
                      "Oluwatosin, what's happening in politics? Tap here to start typing.",
                  counter: SizedBox(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: TSizes.md + 2,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLength: 3000,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
