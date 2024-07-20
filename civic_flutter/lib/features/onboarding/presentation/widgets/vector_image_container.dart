
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VectorImageContainer extends StatelessWidget {
  const VectorImageContainer({required this.imagePath, super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Image(
        height: THelperFunctions.screenHeight() * 0.4,
        width: THelperFunctions.screenWidth() * 0.8,
        image: AssetImage(
          imagePath,
        ),
      ),
    );
  }
}
