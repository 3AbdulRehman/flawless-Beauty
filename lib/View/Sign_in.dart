import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flawless_beauty/View/Widgets/LoginButton.dart';
import 'package:flawless_beauty/View/Widgets/EmailTextField.dart';
import 'package:flawless_beauty/View/Widgets/PassTextField.dart';
import 'package:flawless_beauty/View/Widgets/RegisterButton.dart';
import 'package:flawless_beauty/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
        await _auth.signInWithCredential(credential);

        // Get user information
        final user = authResult.user;

        // Store user information in Firestore
        await _firestore.collection('users').doc(user!.uid).set({
          'name': user.displayName,
          'email': user.email,
          'photoURL': user.photoURL,
        });

        // Navigate to the home screen or perform any other action upon successful sign-in
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

        final UserCredential authResult =
        await _auth.signInWithCredential(facebookAuthCredential);

        // Get user information
        final user = authResult.user;

        // Store user information in Firestore
        await _firestore.collection('users').doc(user!.uid).set({
          'name': user.displayName,
          'email': user.email,
          'photoURL': user.photoURL,
        });

        // Navigate to the home screen or perform any other action upon successful sign-in
      }
    } catch (error) {
      print('Error signing in with Facebook: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double responsiveTextSize(double fontSize) {
      // Calculate responsive font size
      return fontSize * (w / 414); // 414 is a reference screen width
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 110),
          child: Column(
            children: [
              // Container(
              //   height: 180,
              //   width: 180,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(100),
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/logo.png'),
              //         fit: BoxFit.cover),
              //   ),
              // ),
              Image.asset(
                'assets/images/login.jpg',
                height: h * 0.25,
                width: w * 1.2,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Center(
                child: Text(
                  "Flawless Beauty Saloon",
                  style: TextStyle(
                      fontSize: responsiveTextSize(30),
                      fontFamily: "FontMain",
                      color: ThemeColor),
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              EmaiTextField(labelText: "Email", controller: emailcontroller),
              SizedBox(
                height: h * 0.02,
              ),
              PasswordTextField(
                  labelText: "Password", controller: passcontroller),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 38),
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: responsiveTextSize(18),
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              LoginButton(label: "Login", onPressed: () {

              }),
              SizedBox(
                height: h * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Sign Up Using',
                    style: TextStyle(
                        fontSize: responsiveTextSize(18),
                        color: Colors.black,
                        fontFamily: 'FontMain'),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: ImageIcon(
                            AssetImage('assets/icons/google.png'),
                            size: 32,
                            color: Colors.red,
                          ),
                          onTap: (){
                            _signInWithGoogle();
                          },
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 33,
                          ),
                          onTap: (){
                         //   _signInWithFacebook();
                          },
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        GestureDetector(
                          child: ImageIcon(
                            AssetImage('assets/icons/x.png'),
                            size: 32,
                            color: Colors.black,
                          ),
                          onTap: (){


                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
