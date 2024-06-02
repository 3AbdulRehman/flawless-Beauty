

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/personalization/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';


/// Repository class for user related operation
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user)async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on User ID.
  Future<UserModel> fetchUserDetails()async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// Function to update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser)async{
    try{
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json)async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to Remove User Data fom FireStore.
  Future<void> removeUserRecord(String userId)async{
    try{
      await _db.collection('Users').doc(userId).delete();
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload any Image
  Future<String> uploadImage(String path, XFile image)async{
    try{
     final ref = FirebaseStorage.instance.ref(path).child(image.name);
     await ref.putFile(File(image.path));
     final url = await ref.getDownloadURL();
     return url;
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptoion(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TFormatException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }

  }


}