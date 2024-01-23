import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //Image
        RoundedImage(
          imageUrl: cartItem.image ??'',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        //Title , price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextWithVerifiedIcon(title: cartItem.brandName??''),
              Flexible(
                  child: ProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),

              //Attributes
              Text.rich(TextSpan(children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(children: [
                TextSpan(text: e.key,style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: e.value,style: Theme.of(context).textTheme.bodyLarge),
              ]),
              ).toList()
              ))
            ],
          ),
        )
      ],
    );
  }
}
