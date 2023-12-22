import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key,  this.itemCount=6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ShimmerEffect(width: 55, height: 55, radius: 55,),
                SizedBox(height: TSizes.spaceBtwItems,),

                // Text
                ShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
