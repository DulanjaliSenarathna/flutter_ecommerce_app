import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brands with product count
            BrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //Brand top 3 product images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
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
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const ShimmerEffect(
                width: 100,
                height: 100,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )));
  }
}
