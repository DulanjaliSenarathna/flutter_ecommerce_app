import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}