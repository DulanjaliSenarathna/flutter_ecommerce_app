import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
          TPrimaryHeaderContainer(child: Column(
            children: [
              TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),
              

              //User profile card
               const UserProfileTile(),
              const SizedBox(height: TSizes.spaceBtwSections,),
            ],
          )),

          //Body
           Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Account Settings', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping delivery address', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and completed orders', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notofocation message', onTap: (){},),
              SettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: (){},),

              //App settings
              const SizedBox(height: TSizes.spaceBtwSections,),
              const TSectionHeading(title: 'App Settings', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload data your cloud firebase'),
              SettingsMenuTile(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recommendation based on location',trailing: Switch(value: true, onChanged: (value){}),),
              SettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages',trailing: Switch(value: false, onChanged: (value){}),),
              SettingsMenuTile(icon: Iconsax.image, title: 'HD Image quality', subTitle: 'Set image quality to be seen',trailing: Switch(value: true, onChanged: (value){}),),

              //Logout Button
              const SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: (){}, child: const Text('Logout'),),
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 2.5,),
            ],
          ),
          )
          ],
        ),
      ),
    );
  }
}

