import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              //Brands
              const BrandShowcase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),
              const BrandShowcase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //Products
              TSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ]))
      ],
    );
  }
}
