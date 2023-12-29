import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price and sale price
        Row(
          children: [
            //Sale tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            //Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('\$${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    )),
           if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        //Title
         ProductTitleText(title: product.title),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        //Stock status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            CircularImage(
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image:'',
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
             BrandTitleTextWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name:'',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
