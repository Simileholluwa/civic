import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQueryProvider = ref.read(locationSearchQueryProvider.notifier);
    final postState = ref.watch(postCreationProvider(post));
    final postNotifier = ref.read(postCreationProvider(post).notifier);
    final data = ref.watch(searchPlacesProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          70,
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: TSizes.sm - 2,
              top: TSizes.sm,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: CreateContentSearchBar(
                onChanged: (text) {
                  searchQueryProvider.searchQuery = text;
                },
                trailingWidget: [
                  IconButton(
                    onPressed: () {
                      ref
                        ..invalidate(searchNearbyPlacesProvider)
                        ..invalidate(searchPlacesProvider);
                    },
                    icon: const Icon(
                      Iconsax.refresh,
                    ),
                  ),
                  GestureDetector(
                    onTap: postState.locations.isEmpty ? null : context.pop,
                    child: Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.only(
                        left: TSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        color: postState.locations.isEmpty
                            ? Theme.of(context).disabledColor
                            : TColors.primary,
                        borderRadius: BorderRadius.circular(
                          TSizes.xs,
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: data.isLoading
          ? const AppLoadingWidget()
          : data.when(
              data: (data) {
                if (data == null || data.isEmpty) {
                  return const CreateContentLocationError();
                }
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0,
                    );
                  },
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final place = data[index];
                    final selectedIndex = postState.locations.contains(place);
                    return InkWell(
                      onTap: () {
                        if (!selectedIndex) {
                          postNotifier.addLocation(
                            [place],
                          );
                        } else {
                          postNotifier.removeLocation(
                            place,
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          TSizes.md + 2,
                          TSizes.sm + 4,
                          TSizes.md + 2,
                          index == 0 ? TSizes.md : TSizes.sm + 4,
                        ),
                        color: selectedIndex
                            ? TColors.primary.withAlpha(
                                50,
                              )
                            : null,
                        child: Text(
                          place.place,
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, st) {
                return const CreateContentLocationError();
              },
              loading: () {
                return const AppLoadingWidget();
              },
            ),
      bottomNavigationBar: postState.locations.isNotEmpty
          ? SizedBox(
              height: 50,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                ),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(
                      postState.locations[index].place,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    elevation: 0,
                    surfaceTintColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    deleteIcon: const Icon(
                      Icons.clear,
                      color: TColors.secondary,
                    ),
                    onDeleted: () => postNotifier.removeLocation(
                      postState.locations[index],
                    ),
                  );
                },
                separatorBuilder: (_, _) {
                  return const SizedBox(
                    width: TSizes.sm,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: postState.locations.length,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
