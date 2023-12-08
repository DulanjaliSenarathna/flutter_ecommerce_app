import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
                  width: double.infinity,
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5):Colors.transparent ,
                  borderColor: selectedAddress ? Colors.transparent: dark? TColors.darkerGrey:TColors.grey ,
                  margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 5,
                        top: 0,
                        child: Icon(selectedAddress ? Iconsax.tick_circle5:null,
                        color: selectedAddress? dark ? TColors.light:TColors.dark.withOpacity(0.6): null,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dulanjali Senarathna',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: TSizes.sm/2,),
                          const Text('+94765489545', maxLines: 1, overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: TSizes.sm/2,),
                          const Text('776/A, Rukhena Watta, Kanuggalla, Ellawala', softWrap: true,),
                        ],
                      )
                    ],
                  ),
                );
  }
}