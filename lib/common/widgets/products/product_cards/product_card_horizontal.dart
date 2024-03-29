import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/constants/enums.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          //Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                //Thumbnail Image
                 SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    )),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //Sale tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '$salePercentage',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                //Fav icon button
                 Positioned(
                    top: 0, right: 0, child: FavouriteIcon(productId: product.id))
              ],
            ),
          ),

          //Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      BrandTitleTextWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                 Flexible(
                   child: Column(
                     children: [

                      if(product.productType == ProductType.single.toString() && product.salePrice >0)
                       Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          )),
                       //Price
                       Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: ProductPriceText(
                            price: controller.getProductPrice(product),
                          )),
                     ],
                   ),
                 ),

                //Add to cart button
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(TSizes.productImageRadius))),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ))),
                )
              ],
            )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
