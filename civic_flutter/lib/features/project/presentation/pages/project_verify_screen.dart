import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectVerifyScreen extends ConsumerWidget {
  const ProjectVerifyScreen({
    super.key,
    required this.projectLocations,
    required this.id,
    this.fromDetails = true,
  });

  final List<AWSPlaces> projectLocations;
  final int id;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyUserProximity = ref.watch(
      verifyUserProximityProvider(
        projectLocations: projectLocations,
      ),
    );
    ref.watch(
      appScrollVisibilityProvider(
        false,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.only(top: fromDetails ? 0 : 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 4,
            title: Text(
              'Verify Project',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: verifyUserProximity.when(
          data: (value) {
            if (value['canVet'] == true) {
              return const Text('You are near the project location');
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Image(
                    height: 250,
                    image: AssetImage(
                      TImageTexts.noData,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'You are',
                      children: [
                        TextSpan(
                          text: ' ${value['distance']}km',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: ' away from the project location. You must be within',
                        ),
                        TextSpan(
                          text: ' 1km',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: ' to vet this project.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
          },
          loading: () => AppLoadingWidget(
            textWidget: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: const Text('Verifying your location...'),
            ),
          ),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}
