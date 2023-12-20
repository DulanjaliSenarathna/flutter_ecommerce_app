import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send reset password email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove the loader
      FullScreenLoader.stopLoading();

      // Show success screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to reset your password'.tr);

      // Redirect
      Get.to(() => const ResetPasswordScreen(
            email: '',
          ));
    } catch (e) {
      // Remove the loader
      FullScreenLoader.stopLoading();
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove the loader
      FullScreenLoader.stopLoading();

      // Show success screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to reset your password'.tr);
    } catch (e) {
      // Remove the loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
