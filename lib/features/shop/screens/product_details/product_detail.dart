import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/utils/constants/sizes.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return   Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image slider
            const ProductImageSlider(),

            //Product Details
            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                //Rating & share button
                const RatingAndShare(),

                //Price , title, stock and brand
                const ProductMetaData(),

                //Attributes
                const ProductAttributes(),
                const SizedBox(height: TSizes.spaceBtwSections,),

                //Checkout Button
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                const SizedBox(height: TSizes.spaceBtwSections,),

                //Description
                const TSectionHeading(title: 'Description', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'Landing in a Dark Marina Blue colourway, this standard-fit tee features a classic crew neckline, short sleeves and ribbed detailing to the collar.Made from smooth cotton for a durable wear, this tee is signed off with signature Nike Swoosh branding to the chest in white. ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'See more',
                  trimExpandedText: 'See less',
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                ),

                //Reviews
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TSectionHeading(title: 'Reviews(199)', onPressed: (){}, showActionButton: false,),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3, size: 18,))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections,),

              ],
            ),
             )
          ],
        ),
      ),
    );
  }
}

