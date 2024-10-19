import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/location_service_provider.dart';
import 'package:civic_flutter/core/widgets/app/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_location_error.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ChooseLocationsScreen extends ConsumerWidget {
  const ChooseLocationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQueryProvider = ref.watch(locationSearchQueryProvider.notifier);
    final selectLocations = ref.watch(selectLocationsProvider.notifier);
    final selectedLocations = ref.watch(selectLocationsProvider);
    final data = ref.watch(searchPlacesProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          70,
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: TSizes.sm - 2,
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
                  searchQueryProvider.setSearchQuery(text);
                },
                trailingWidget: [
                  IconButton(
                    onPressed: () {
                      ref.invalidate(searchNearbyPlacesProvider);
                      ref.invalidate(searchPlacesProvider);
                    },
                    icon: const Icon(
                      Iconsax.refresh,
                    ),
                  ),
                  GestureDetector(
                    onTap: selectedLocations.isEmpty ? null : context.pop,
                    child: Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.only(
                            left: TSizes.sm,),
                      decoration: BoxDecoration(
                        color: selectedLocations.isEmpty
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
          ? AppLoadingWidget(
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
            )
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
                    final selectedIndex = selectedLocations.contains(place);
                    return InkWell(
                      onTap: () {
                        if (!selectedIndex) {
                          selectLocations.addLocation(
                            place,
                          );
                        } else {
                          selectLocations.removeLocation(
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
                return AppLoadingWidget(
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.dark
                      : TColors.light,
                );
              },
            ),
      bottomNavigationBar: selectedLocations.isNotEmpty
          ? SizedBox(
              height: 50,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                ),
                itemBuilder: (context, index) {
                  return Chip(
                    // avatar: UserProfileImage(
                    //   imageUrl: tagState[index].userInfo!.imageUrl!,
                    // ),
                    label: Text(
                      selectedLocations[index].place,
                      style: Theme.of(context).textTheme.labelMedium!,
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
                    onDeleted: () => selectLocations.removeLocation(
                      selectedLocations[index],
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    width: TSizes.sm,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: selectedLocations.length,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
