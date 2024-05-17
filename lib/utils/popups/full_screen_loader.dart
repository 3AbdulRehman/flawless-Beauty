import 'package:flawless_beauty/common/styles/loader/animated_loader.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///  A utility class for managing a Full Screen loading Dialog
class TFullScreenLoader{

  ///Open a Full Screen Loading dialog with a given text and Animation
  ///This Method doesn't return anything.
  ///
  /// Parameter :
  ///          - text: the text to the displayed in the loading dialog
  ///          - animation: The Lottie animation to be shown.

  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!, // use Get.overlayContext for overlay dialog
        barrierDismissible: false, // Dialog can't be Dismissed by tapping outside it.
        builder: (_)=> PopScope(
          canPop: false,
            child: Container(
              color: THelpFunction.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  TAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
        ),
    );
  }
  /// Stop the Currently open Loading dialog
/// This Method doesn't return anything.

  static stopLoading()async{
    Navigator.of(Get.overlayContext!).pop(); // Close the Dialog using the Navigator
  }

}