import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.maxLines=1,
     this.color,
     this.textAlign=TextAlign.center,
     this.brandTextSize=TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      //check which brandSize is required and set that style.
      style: brandTextSize == TextSizes.small ?
       Theme.of(context).textTheme.labelMedium!.apply(color: color):
       brandTextSize == TextSizes.medium ?Theme.of(context).textTheme.bodyLarge!.apply(color: color):
       brandTextSize == TextSizes.large ? Theme.of(context).textTheme.titleLarge!.apply(color: color):
       Theme.of(context).textTheme.bodyMedium!.apply(color: color) ,
    );
  }
}
