import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AnimatedStarRating extends StatefulWidget {
  const AnimatedStarRating({
    required this.onRatingSelected,
    super.key,
    this.maxRating = 5,
    this.size = 40,
    this.selectedColor = Colors.amber,
    this.unselectedColor = Colors.grey,
    this.currentRating = 0,
  });
  final int maxRating;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;
  final ValueChanged<int> onRatingSelected;
  final int currentRating;

  @override
  AnimatedStarRatingState createState() => AnimatedStarRatingState();
}

class AnimatedStarRatingState extends State<AnimatedStarRating> {
  @override
  void initState() {
    super.initState();
    _currentRating = widget.currentRating;
  }

  int _currentRating = 0;

  void _setRating(int rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onRatingSelected(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        return GestureDetector(
          onTap: () => _setRating(index + 1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Iconsax.magic_star5,
                size: widget.size,
                color: index < _currentRating
                    ? widget.selectedColor
                    : widget.unselectedColor,
              ),
            ),
          ),
        );
      }),
    );
  }
}
