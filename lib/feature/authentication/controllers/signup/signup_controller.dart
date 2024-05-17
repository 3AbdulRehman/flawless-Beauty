
import 'package:flawless_beauty/data/repositories/user/user_repository.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/verify_email.dart';
import 'package:flawless_beauty/personalization/models/user_model.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:flawless_beauty/utils/popups/full_screen_loader.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  /// Variable
  final hidePassword = true.obs;  // Observable for Hiding/showing Password
  final privacyPolicy = true.obs;  // Observable for Hiding/showing Password
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key From Validation

  /// SignUP
  void signup() async {
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are Processing your information', TImage.docerAnimation);

      // Check Internet Connection
      final isconnected = await NetworkManager.instance.isConnected();
      if(!isconnected) {
        // remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if(!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(!privacyPolicy.value){
        TLoader.warningSnackBar(title: 'Accept Privacy Policy',message: 'in Order to create Account, You must have to read and accept the privacy policy & Term of use');
        return;
      }

      // Register User in the Firebase Authentication & Save user Data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoader.successSnackBar(title: 'Congratulation',message: 'Your Account has been Created! Verify email to continue');

      // Move to Verify Email Screen
      Get.to(()=>  VerifyEmailScreen(email: email.text.trim()));

    }catch(e){
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoader.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}
