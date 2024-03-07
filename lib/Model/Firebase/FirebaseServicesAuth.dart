import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithGoogle() async {
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

        return user;
      } else {
        return null;
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }

  Future<User?> signInWithFacebook() async {
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

        return user;
      } else {
        return null;
      }
    } catch (error) {
      print('Error signing in with Facebook: $error');
      return null;
    }
  }
}
