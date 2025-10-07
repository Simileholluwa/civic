import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

typedef ContentBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class RootCommentWidget extends StatelessWidget {
  const RootCommentWidget(
    this.content,
    this.shouldDrawLine,
    this.rootCommentUserProfileUrl, {
    super.key,
  });
  final Widget content;
  final bool shouldDrawLine;
  final String rootCommentUserProfileUrl;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RootPainter(
        Theme.of(context).dividerColor,
        shouldDrawLine: shouldDrawLine,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreferredSize(
            preferredSize: const Size(50, 50),
            child: GestureDetector(
              onTap: () async {},
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  rootCommentUserProfileUrl,
                ),
                radius: 25,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}

class CommentChildWidget extends StatelessWidget {
  const CommentChildWidget({
    required this.isLast,
    required this.content,
    this.hasAvatar = true,
    this.reply,
    super.key,
  });
  final Widget? content;
  final bool? isLast;
  final bool hasAvatar;
  final Post? reply;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(
      left: 58,
      top: hasAvatar ? 15 : 0,
    );

    return CustomPaint(
      painter: _Painter(
        isLast: isLast!,
        padding: padding,
        pathColor: Theme.of(context).dividerColor,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: padding,
        child: Column(
          children: [
            if (hasAvatar)
              ContentCreatorInfo(
                creator: reply!.owner!,
                timeAgo: THelperFunctions.humanizeDateTime(
                  reply!.dateCreated!,
                ),
              ),
            if (hasAvatar) const SizedBox(height: 5),
            content!,
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.isLast,
    this.padding,
    this.pathColor,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.butt;
  }
  bool isLast = false;
  EdgeInsets? padding;
  Color? pathColor;

  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    const double rootDx = 25;
    path
      ..moveTo(rootDx, 0)
      ..cubicTo(
        rootDx,
        0,
        rootDx,
        padding!.top + 30,
        rootDx * 2,
        padding!.top + 30,
      );
    canvas.drawPath(path, _paint);

    if (!isLast) {
      canvas.drawLine(
        const Offset(rootDx, 0),
        Offset(rootDx, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RootPainter extends CustomPainter {
  RootPainter(
    this.pathColor, {
    required this.shouldDrawLine,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.butt;
  }
  late Paint _paint;
  Color? pathColor;
  final bool shouldDrawLine;

  @override
  void paint(Canvas canvas, Size size) {
    const double dx = 25;
    if (shouldDrawLine) {
      canvas.drawLine(
        const Offset(dx, 50),
        Offset(dx, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
