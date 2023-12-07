import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            ProfileMenu(onPressed: () {  }, title: 'Name', value: 'Dulanjali Senarathna',),
            ProfileMenu(onPressed: () {  }, title: 'Username', value: 'dulanjali993',),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Heading personal info
            const TSectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(onPressed: () {  }, title: 'User ID', value: '45689',),
            ProfileMenu(onPressed: () {  }, title: 'E-mail', value: 'dulanjali@gmail.com',),
            ProfileMenu(onPressed: () {  }, title: 'Phone Number', value: '0713725452',),
            ProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
            ProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '29 Sep 1994',),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(onPressed: (){}, 
              child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
            )
         
          ],
        ),
        ),
      ),
    );
  }
}

