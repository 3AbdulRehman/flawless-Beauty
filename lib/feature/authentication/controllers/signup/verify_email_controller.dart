import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawless_beauty/common/styles/success_screen/success_screen.dart';
import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email WhenEver Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnackBar(title: 'Email Sent',
          message: 'Please Check your inbox and Verify your email.');
    } catch (e) {
      TLoader.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on email Verification.
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() =>
            SuccessScreen(
                image: TImage.successfullyRegisterAnimation,
                title: TTexts.yourAccountCreated,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

/// Manual Check if Email Verified
 checkEmailVerificationStatus()async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser !=null && currentUser.emailVerified){
      Get.off(
          ()=> SuccessScreen(
              image: TImage.successfullyRegisterAnimation,
              title: TTexts.yourAccountCreated,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
          )
      );
    }
 }
}
