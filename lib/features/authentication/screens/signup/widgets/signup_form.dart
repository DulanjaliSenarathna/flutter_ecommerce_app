import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    
    return Form(child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)
                )
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
             Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user)
                )
              ),
            ),
           
          ],
        ),
        
        const SizedBox(height: TSizes.spaceBtwInputFields),
    
        //user name
        TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)
                )
              ),
    
        const SizedBox(height: TSizes.spaceBtwInputFields),
        
        //email
        TextFormField(
                
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct)
                )
              ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
    
      //Phone number
        TextFormField(
                
                decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)
                )
              ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
    
        //Password
        TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash)
                )
              ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
      
      //Terms and conditions checkbox
      const TTermsAndConditionsCheckbox(),
      const SizedBox(height: 10),
      //Sign up button
      SizedBox(
        width:double.infinity ,
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const VerifyEmailScreen()), child: const Text(TTexts.createAccount),),
      ),
      const SizedBox(height: 10),
    
      const TFormDevider(dividerText: TTexts.orSignUpWith),
       const SizedBox(height: 10),
      const TSocialButtons()
    
      ],
    )
                 );
  }
}

