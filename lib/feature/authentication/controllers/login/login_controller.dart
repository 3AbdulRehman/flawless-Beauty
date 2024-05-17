

import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:flawless_beauty/utils/popups/full_screen_loader.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{


  /// Variable
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')?? "";
    super.onInit();
  }

   /// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---- Email & Password SignIn __________________________________________________________________________________________
  Future<void> emailAndPasswordSignIn()async{
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging You In....', TImage.docerAnimation);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // From Validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      // Save Data if Remember me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap!',message: e.toString());


    }
  }

  ///______________________________________________________________ Google SignIn Authentication___________________________________________________________
   Future<void> googleSignIn()async{
    try{
      // start Loading
      TFullScreenLoader.openLoadingDialog('Loading you in', TImage.docerAnimation);

      // Check Internet Connectivity
      final isConneted = await NetworkManager.instance.isConnected();
      if(!isConneted){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Records
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();


    }catch (e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Display Error
      TLoader.errorSnackBar(title: 'oh Snap',message: e.toString());
    }

   }

}