import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Popular Products'),showBackArrow: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem( value: option,child: Text(option))).toList(),
              onChanged: (value){}
              ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            //Products
            GridLayout(itemCount: 6, itemBuilder: (_,index)=>const ProductCardVertical())
          ],
        ),
      ),
    );
  }
}
