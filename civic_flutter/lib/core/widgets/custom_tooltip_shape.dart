import 'package:flutter/material.dart';

class CustomTooltipShape extends StatelessWidget {
  final List<Widget> children;

  const CustomTooltipShape({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TooltipPainter(
        color: Theme.of(context).scaffoldBackgroundColor,
        dividerColor: Theme.of(context).dividerColor,
      ),
      child: Container(
        width: 340,
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class TooltipPainter extends CustomPainter {
  final Color color;
  final Color dividerColor;

  TooltipPainter({
    super.repaint,
    required this.color,
    required this.dividerColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final strokePaint = Paint()
      ..color = dividerColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final path = Path();
    const radius = 12.0;
    const arrowHeight = 10.0;
    const arrowWidth = 20.0;

    // Start drawing from the top left corner, accounting for the radius
    path.moveTo(radius, 0);

    // Top line
    path.lineTo(size.width - radius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(
        size.width,
        radius,
      ),
      radius: const Radius.circular(
        radius,
      ),
    );

    // Right line
    path.lineTo(
      size.width,
      size.height - radius - arrowHeight,
    );

    // Bottom-right corner
    path.arcToPoint(
      Offset(
        size.width - radius,
        size.height - arrowHeight,
      ),
      radius: const Radius.circular(
        radius,
      ),
    );

    // Bottom line
    path.lineTo(
      size.width / 2 + arrowWidth / 2,
      size.height - arrowHeight,
    );

    // Downward arrow
    path.lineTo(
      size.width / 2,
      size.height,
    );
    path.lineTo(
      size.width / 2 - arrowWidth / 2,
      size.height - arrowHeight,
    );

    // Bottom-left line
    path.lineTo(
      radius,
      size.height - arrowHeight,
    );

    // Bottom-left corner
    path.arcToPoint(
      Offset(
        0,
        size.height - radius - arrowHeight,
      ),
      radius: const Radius.circular(
        radius,
      ),
    );

    // Left line
    path.lineTo(
      0,
      radius,
    );

    // Top-left corner
    path.arcToPoint(
      const Offset(
        radius,
        0,
      ),
      radius: const Radius.circular(
        radius,
      ),
    );

    // Close the path
    path.close();

    // Draw the stroke first so the fill color sits on top
    canvas.drawPath(path, strokePaint);

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
