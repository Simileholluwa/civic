import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppPulsingCircle extends StatefulWidget {
  const AppPulsingCircle({super.key});

  @override
  State<AppPulsingCircle> createState() => _AppPulsingCircleState();
}

class _AppPulsingCircleState extends State<AppPulsingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
        reverseCurve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: TColors.primary.withAlpha(80),
          ),
          child: Center(
            child: Container(
              width: 70 * _animation.value,
              height: 70 * _animation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: TColors.primary.withAlpha(50),
              ),
              child: Center(
                child: Container(
                  width: 50 * _animation.value,
                  height: 50 * _animation.value,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.primary,
                  ),
                  child: const Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
