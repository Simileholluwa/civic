import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/location_error_widget.dart';
import 'package:civic_flutter/core/widgets/search_bar_widget.dart';
import 'package:civic_flutter/core/providers/current_location_data_provider.dart';
import 'package:civic_flutter/core/widgets/selected_locations_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> selectLocationBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final searchQueryProvider =
              ref.watch(locationSearchQueryProvider.notifier);
          final selectLocations = ref.watch(selectLocationsProvider.notifier);
          final selectedLocations = ref.watch(selectLocationsProvider);
          final data = ref.watch(searchPlacesProvider);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(
                75,
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: TSizes.sm - 2,
                  ),
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
                        Icons.clear,
                      ),
                    ),
                    centerTitle: true,
                    title: SearchBarWidget(
                      onChanged: (text) {
                        searchQueryProvider.setSearchQuery(text);
                      },
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: TSizes.sm,
                        ),
                        child: IconButton(
                          onPressed: () {
                            ref.invalidate(searchNearbyPlacesProvider);
                            ref.invalidate(searchPlacesProvider);
                          },
                          icon: const Icon(
                            Iconsax.refresh,
                          ),
                        ),
                      ),
                    ],
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
                        return const LocationErrorWidget();
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
                          final selectedIndex =
                              selectedLocations.contains(place);
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
                      return const LocationErrorWidget();
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
                ? const SelectedLocationsWidget()
                : const SizedBox.shrink(),
          );
        },
      );
    },
  );
}
