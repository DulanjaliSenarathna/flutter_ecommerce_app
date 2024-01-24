import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/list_tiles/payment_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/payment_method_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal',image: TImages.paypal, );
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  children: [
                    const TSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.paypal, name: 'Paypal'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.googlePay, name: 'Google Pay'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.applePay, name: 'Apple Pay'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.visa, name: 'VISA'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.masterCard, name: 'Master Card'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.paytm, name: 'Paytm'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.paystack, name: 'Paystack'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    PaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.creditCard, name: 'Credit Card'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems/2,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ));
  }
}
