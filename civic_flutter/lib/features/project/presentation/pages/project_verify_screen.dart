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
  });

  final List<AWSPlaces> projectLocations;
  final int id;

  static String routePath([int? id]) => '${id ?? ':id'}/verify';
  static String routeName() => 'project/verify';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyUserProximity = ref.watch(
      verifyUserProximityProvider(
        projectLocations: projectLocations,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
            if (value) {
              return const Text('You are near the project location');
            } else {
              return const Text('You are not near the project location');
            }
          },
          loading: () => AppLoadingWidget(
            textWidget: Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: const Text('Verifying your location...'),
            ),
          ),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}
