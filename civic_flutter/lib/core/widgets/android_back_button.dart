import 'package:flutter/cupertino.dart';

class ShouldExit extends StatelessWidget {
  const ShouldExit({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      
      child: child,
    );
  }
}
