import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {

    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brands with product count
           BrandCard(showBorder: false, brand: BrandModel.empty(),),
          const SizedBox(height: TSizes.spaceBtwItems,),

          //Brand top 3 product images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
        child: RoundedContainer(
            height: 100,
            backgroundColor: dark ? TColors.darkGrey : TColors.light,
            margin: const EdgeInsets.only(right: TSizes.sm),
            padding: const EdgeInsets.all(TSizes.md),
            child:  Image(
                fit: BoxFit.contain,
                image: AssetImage(image))));
  }
}