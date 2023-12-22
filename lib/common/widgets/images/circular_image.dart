import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key, 
    this.fit=BoxFit.cover, 
    required this.image,  
    this.isNetworkImage=false, 
    this.overlayColor, 
    this.backgroundColor, this.width=56, this.height=56, this.padding=TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background color is null then switch it to dark and light mode color design
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage?
          CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context,url,downloadProgress)=> const ShimmerEffect(width: 55, height: 55,radius: 55,),
            errorWidget: (context,url,error)=> const Icon(Icons.error),
            )
          :Image(
            fit: fit,
            image:  AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
