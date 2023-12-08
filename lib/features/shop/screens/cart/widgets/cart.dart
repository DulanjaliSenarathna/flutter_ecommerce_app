import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_,__)=> const SizedBox(height: TSizes.spaceBtwSections,), 
        itemCount: 4,
        itemBuilder: (_,index)=>   const Column(
          children: [
            CartItem(),
            SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70,),
                    //Add and remove button
                ProductQuantityWithAddRemoveButton(),
                  ],
                ),
                
                ProductPriceText(price: '256')
                  
                //
              ],
            )
          ],
        ), 
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: const Text('Checkout \$256')),
      )
    );
  }
}

