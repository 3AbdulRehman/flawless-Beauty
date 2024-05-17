
import 'package:flawless_beauty/data/repositories/user/user_repository.dart';
import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/personalization/screens/profile/profile.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:flawless_beauty/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loader.dart';

class updateNameController extends GetxController{

  static updateNameController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());


//// TextFormField
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserNameForKey = GlobalKey<FormState>();

  /// Init User Data When Home Screen appear
 @override
  void onInit() {
   intializeNames();
    super.onInit();
  }

  /// Fetch User Record
  Future<void> intializeNames()async{
   firstName.text = userController.user.value.firstName;
   lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName()async{
   try{
     // Start Loading
     TFullScreenLoader.openLoadingDialog('We are updating your information', TImage.docerAnimation);

     // Check Internet Connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected){
       TFullScreenLoader.stopLoading();
       return;
     }

     /// Form Validation
     if(!updateUserNameForKey.currentState!.validate()){
       TFullScreenLoader.stopLoading();
       return;
     }

     // Update User`s first & last name in the Firebase Firestore
     Map<String,dynamic> name = {
       'FirstName':firstName.text.trim(),
       'LastName': lastName.text.trim(),
     };
     await userRepository.updateSingleField(name);

     // Update the Rx User value
     userController.user.value.firstName = firstName.text.trim();
     userController.user.value.lastName = lastName.text.trim();

     // Remove Loader
     TFullScreenLoader.stopLoading();

     // Show Success Message
     TLoader.successSnackBar(title: 'Congratulation',message: 'Your Name has been updated.');

     // Move to Previous Screen
     Get.off(()=>const ProfileScreen());

   }catch (e){
     TFullScreenLoader.stopLoading();
     TLoader.errorSnackBar(title: 'Oh Snap!',message: e.toString());

   }
  }

}