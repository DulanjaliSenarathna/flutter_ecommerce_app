import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy Policy acceptance
  final email = TextEditingController(); //Cotroller for email input
  final lastName = TextEditingController(); //Cotroller for last name input
  final username = TextEditingController(); //Cotroller for user name input
  final password = TextEditingController(); //Cotroller for password input
  final firstName = TextEditingController(); //Cotroller for first name input
  final phoneNumber =
      TextEditingController(); //Cotroller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //Signup

  void signup() async {
    try {
      //Start loading
      FullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
         //Remove loader
      FullScreenLoader.stopLoading();
      return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
      //Remove loader
      FullScreenLoader.stopLoading();
      return;
      }
     

      //Privacy policy check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of use');
        return;
      }

      // Register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: firstName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

       //Remove loader
      FullScreenLoader.stopLoading();

      // show success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      //Remove loader
      FullScreenLoader.stopLoading();
      //Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
