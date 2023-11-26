import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

   return GestureDetector(
    onTap: (){},
     child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, wishlist button, discount tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor:dark?TColors.dark:TColors.light,
              child: Stack(
                children: [
                  //Thumbnail image
                  const RoundedImage(imageUrl: TImages.productImage1,
                  applyImageRadius: true,
                  ),
     
                  //Sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),
     
                  //Fav icon button
                  const Positioned(top: 0,right: 0,child: CircularIcon(icon: Iconsax.heart5, color: Colors.red,))
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            
            //Details
              Padding(padding:  const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitleText(title: 'Green Hike Air Shoes', smallSize: true,),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    Row(
                      children: [
                        Text('Nike', overflow: TextOverflow.ellipsis,maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                        const SizedBox(width: TSizes.xs,),
                        const Icon(Iconsax.verify5, color: TColors.primary, size: TSizes.iconXs,)
                      ],
                    ),
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Price
                        const ProductPriceText(price: '35.5',),

                        //Add to cart button
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius)
                            )
                          ),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add,color: TColors.white,))),
                        )
                      ],
                    )
                  ],
                ),
            ),
     
          ],
        ),
      ),
   );
  }
}

