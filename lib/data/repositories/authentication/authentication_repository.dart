import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawless_beauty/data/repositories/user/user_repository.dart';
import 'package:flawless_beauty/feature/authentication/screens/OnBoarding/onbording.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/verify_email.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flawless_beauty/navigation_menu.dart';
import 'package:flawless_beauty/utils/exceptions/firebase_auth_exception.dart';
import 'package:flawless_beauty/utils/exceptions/firebase_exceptions.dart';
import 'package:flawless_beauty/utils/exceptions/format_exceptions.dart';
import 'package:flawless_beauty/utils/exceptions/platform_exceptions.dart';
import 'package:flawless_beauty/utils/local_storage/storage_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authentication User Data
  User? get authUser => _auth.currentUser;


  /// Called from main.dart on app Launch
  @override
  void onReady() {
    // remove the native splash screen
    FlutterNativeSplash.remove();

    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // if the user is logged in
      if (user.emailVerified) {

        // Initialize User Specific Storage
        await TLocalStorage.init(user.uid);

        // if the user's Email is  verified, Navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // if the user's Email is not verified, Navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      // check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*_______________________________________________ Email & Password Sign in __________________________________________*/

  /// [Email Authentication] - Sign In // Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [Email Authentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [ReAuthentication] - ReAuthentication User
Future<void>reAuthenticateWithEmailAndPassword(String email, String password)async{
    try{
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }

}


/*_______________________________________________ Federated identify & Social Sign In  __________________________________________*/

  /// [GoogleAuthentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger  the Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtained the auth Details from a request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new Credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once Signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Somthing went wrong : $e');
      return null;
      //throw 'Something went wrong. Please try again';
    }
  }


  /// [FacebookAuthentication] - Facebook

/*_______________________________________________ ./end Federated identify & Social Sign In __________________________________________*/

  /// [LogoutUser] - Valid for any Authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFormatException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// DELETE USER - Remove User Auth and Firestore Account.
  Future<void>deleteAccount()async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptoion(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TFormatException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


}
