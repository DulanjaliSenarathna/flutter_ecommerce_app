import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const TAppBar(title: Text('Popular Products'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding:  const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [

            //Heading
            const TSectionHeading(title: 'Brands', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            //Brands
            GridLayout(itemCount: 5, mainAxisExtent: 80, 
            itemBuilder: (context,index)=> BrandCard(showBorder: true, onTap: ()=>Get.to(()=>const BrandProducts()),))
          ],
        ),
        ),
      ),
  
    );
  }
}