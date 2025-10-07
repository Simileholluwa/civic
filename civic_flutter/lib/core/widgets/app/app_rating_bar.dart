import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    required this.rating, required this.ratingCount, super.key,
    this.size = 18,
  });
  final double rating;
  final double size;
  final int? ratingCount;

  @override
  Widget build(BuildContext context) {
    final starList = <Widget>[];

    final realNumber = rating.floor();
    final partNumber = ((rating - realNumber) * 10).ceil();

    for (var i = 0; i < 5; i++) {
      if (i < realNumber) {
        starList.add(
          Icon(
            Iconsax.magic_star5,
            color: Theme.of(context).primaryColor,
            size: size,
          ),
        );
      } else if (i == realNumber) {
        starList.add(
          SizedBox(
            height: size,
            width: size,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Icon(
                  Iconsax.magic_star5,
                  color: Theme.of(context).dividerColor,
                  size: size,
                ),
                ClipRect(
                  clipper: _Clipper(part: partNumber),
                  child: Icon(
                    Iconsax.magic_star5,
                    color: Theme.of(context).dividerColor,
                    size: size,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        starList.add(
          Icon(
            Iconsax.magic_star5,
            color: Theme.of(context).dividerColor,
            size: size,
          ),
        );
      }
    }
    ratingCount != null
        ? starList.add(
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '($ratingCount)',
                style: TextStyle(
                  fontSize: size * 0.8,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
          )
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {

  _Clipper({required this.part});
  final int part;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
