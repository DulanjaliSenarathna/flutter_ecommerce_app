import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
                child: Column(
              children: [
                //Appbar
                THomeAppBar(),

                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //Search bar
                TSearchContainer(
                  text: 'Search in Store',
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      //Categories
                      HomeCategories(),
                    ],
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                )
              ],
            )),

            //Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //Promo slider
                    const PromoSlider(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    //Heading
                    TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() =>  AllProducts(
                        title: 'Popular Products',
                        futureMethod:controller.fetchAllFeaturedProducts() ,
                        )),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //Popular products
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const VerticalProductShimmer();
                        }
                        if (controller.featuredProducts.isEmpty) {
                          return Center(
                                child: Text(
                                  'No data found!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      ,
                                ),
                              );
                        }
                        return GridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_, index) =>
                                 ProductCardVertical(product:controller.featuredProducts[index]));
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
