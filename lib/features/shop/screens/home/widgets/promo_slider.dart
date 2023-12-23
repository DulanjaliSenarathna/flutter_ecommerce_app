import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) {
        return const ShimmerEffect(width: double.infinity, height: 190);
      }

      // No data found
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No data found'),
        );
      }else{
return Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map((banner) => RoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
      }
      
    });
  }
}
