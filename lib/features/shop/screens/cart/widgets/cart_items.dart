import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: controller.cartItems.length,
        itemBuilder: (_, index) => Obx(
          () {
            final item = controller.cartItems[index];
            return Column(
              children: [
                CartItem(cartItem: item,),
                if (showAddRemoveButtons)
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          //Add and remove button
                          ProductQuantityWithAddRemoveButton(quantity: item.quantity, add: ()=>controller.addOneToCart(item),
                          remove: ()=>controller.removeOneFromCart(item),),
                        ],
                      ),

                      ProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1))

                      //
                    ],
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
