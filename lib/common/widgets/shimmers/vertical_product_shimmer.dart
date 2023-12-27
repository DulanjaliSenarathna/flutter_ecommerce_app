import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key,  this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_,__) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems,),

            // Text
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            ShimmerEffect(width: 110, height: 15)
          ],
        ),
      )
      );
  }
}
