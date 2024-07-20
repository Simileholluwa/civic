
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';

class ShouldExit extends StatelessWidget {
  const ShouldExit({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          THelperFunctions.shouldExitApp();
        }
      },
      child: child,
    );
  }
}
