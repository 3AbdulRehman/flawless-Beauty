import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/data/repositories/user/user_repository.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flawless_beauty/personalization/models/user_model.dart';
import 'package:flawless_beauty/personalization/screens/profile/re_authenticate_user_login_form.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:flawless_beauty/utils/popups/full_screen_loader.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  /// use these field to delete Account
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  ///////////////////////////////////
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch User Record Data
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First upload Rx user and then check if user data is already stored. if not store new data
      await fetchUserRecord();

      // if no record already stored
      if(user.value.id.isEmpty){
        if (userCredentials != null) {
          // Convert Name to first and last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              username: username,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '',
          );

          /// Save user Data to Firestore
          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      TLoader.warningSnackBar(
          title: 'Data not saved',
          message: 'Message went wrong while saying your information. You can re-save your data in your profile');
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPop() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSize.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete your account permanently? This action is not reversible and all of your data will be removed Permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
            child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSize.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImage.docerAnimation);

      ///First re-Authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re Verify auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImage.docerAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512, maxWidth: 512);

      if(image != null){
        imageUploading.value = true;
        // upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // update user image records
        Map<String, dynamic> json ={'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoader.successSnackBar(title: 'Congratulations',message: 'Your Profile Image has been updated!.');

      }
    }catch (e){
      TLoader.errorSnackBar(title: 'oh Snap',message: 'Something went wrong: $e');
    }finally{
      imageUploading.value =false;
    }
  }



}
