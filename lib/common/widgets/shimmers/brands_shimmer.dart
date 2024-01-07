
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key, this.itemCount=4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
        mainAxisExtent: 80, itemCount: itemCount, itemBuilder: (_,__)=>const ShimmerEffect(width: 300, height: 80));
  }
}
