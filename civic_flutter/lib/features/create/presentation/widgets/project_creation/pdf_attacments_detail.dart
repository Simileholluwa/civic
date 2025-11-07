import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PdfAttacmentsDetail extends StatelessWidget {
  const PdfAttacmentsDetail({
    required this.pdfPaths,
    required this.index,
    required this.showRemove,
    this.onRemove,
    super.key,
  });

  final List<String> pdfPaths;
  final int index;
  final bool showRemove;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(0, 6, 10, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Row(
            children: [
              FadeInImage(
                image: const AssetImage(
                  'assets/images/pdf.png',
                ),
                placeholder: MemoryImage(
                  kTransparentImage,
                ),
                fit: BoxFit.cover,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pdfPaths[index].split('/').last,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
                left: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(
                  TSizes.sm,
                ),
                topLeft: Radius.circular(
                  TSizes.sm,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '${index + 1}/${pdfPaths.length}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        if (showRemove)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                    left: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      TSizes.sm,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Remove',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: TColors.secondary,
                        ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
