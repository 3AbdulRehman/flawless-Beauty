import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/feature/authentication/screens/Password_configuration/reset_password.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:flawless_beauty/utils/popups/full_screen_loader.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImage.docerAnimation);

      // Check the Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());
      // remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoader.successSnackBar(title: 'Email sent',
          message: 'Email Link sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request', TImage.docerAnimation);

      // Check the Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoader.successSnackBar(title: 'Email sent', message: 'Email Link sent to Reset your Password'.tr);

      
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

}