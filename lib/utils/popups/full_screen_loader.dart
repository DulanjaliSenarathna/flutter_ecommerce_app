//A utility class for managing a full-screen loading dialog
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class FullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation.
  // This method doesn't return anything

  // Parameters
  // text - The text to be displayed in the loading dialog
  // animation - The lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    final dark = THelperFunctions.isDarkMode(Get.context!);
    showDialog(
        context: Get.overlayContext!, //Use overlayContext for overlay dialogs
        barrierDismissible:
            false, // The dialog can't be dissmissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: dark ? TColors.dark : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ), // Adjust the spacing as needed
                    AnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              ),
            )));
  }

  // Stop the currently open loading dialog
  // This method doesn't return anything

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();// close the dialog using the navigator
  }
}
