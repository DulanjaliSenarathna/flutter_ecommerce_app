import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key,  this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index)=>const SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_,__)=>const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Image
            ShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),

            //Text
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 160, height: 15),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 110, height: 15),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  ShimmerEffect(width: 80, height: 15),
                  Spacer()
                ],
            )
          ],
        ),  ),
    );
  }
}
