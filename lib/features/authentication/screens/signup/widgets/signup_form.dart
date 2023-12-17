import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(

      key: controller.signupFormKey,
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value)=> TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user))),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                 validator: (value)=> TValidator.validateEmptyText('Last Name', value),
        
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user))),
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwInputFields),

        //user name
        TextFormField(
          controller: controller.username,
           validator: (value)=> TValidator.validateEmptyText('User Name', value),
        
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit))),

        const SizedBox(height: TSizes.spaceBtwInputFields),

        //email
        TextFormField(
          controller: controller.email,
           validator: (value)=> TValidator.validateEmail(value),
        
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        //Phone number
        TextFormField(
          controller: controller.phoneNumber,
           validator: (value)=> TValidator.validatePhoneNumber( value),
        
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        //Password
        Obx(
          ()=> TextFormField(
            controller: controller.password,
             validator: (value)=> TValidator.validatePassword(value),
          
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash:Iconsax.eye))
                  )),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        //Terms and conditions checkbox
        const TTermsAndConditionsCheckbox(),
        const SizedBox(height: TSizes.spaceBtwSections),
        //Sign up button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.signup(),
            child: const Text(TTexts.createAccount),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        const TFormDevider(dividerText: TTexts.orSignUpWith),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        const TSocialButtons()
      ],
    ));
  }
}
