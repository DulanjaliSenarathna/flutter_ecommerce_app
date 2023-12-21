import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
          children: [
            //Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
              const CircularImage(image: TImages.user, width: 80, height: 80,),
              TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                 
                ],
              ),
            ),

            //Details
            const SizedBox(height: TSizes.spaceBtwItems/2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Heading profile info
            const TSectionHeading(title: 'Profile Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(onPressed: () => Get.to(()=> const ChangeName()), title: 'Name', value: controller.user.value.fullName,),
            ProfileMenu(onPressed: () {  }, title: 'Username', value: controller.user.value.username,),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Heading personal info
            const TSectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(onPressed: () {  }, title: 'User ID', value: controller.user.value.id,),
            ProfileMenu(onPressed: () {  }, title: 'E-mail', value: controller.user.value.email),
            ProfileMenu(onPressed: () {  }, title: 'Phone Number', value: controller.user.value.phoneNumber),
            ProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
            ProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '29 Sep 1994',),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(onPressed: ()=> controller.deleteAccountWarningPopup(), 
              child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
            )
         
          ],
        ),
        ),
      ),
    );
  }
}

