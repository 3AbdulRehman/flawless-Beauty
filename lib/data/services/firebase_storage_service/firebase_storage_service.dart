

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController{
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // Upload Local Assets from IDE

 // Return a Uint8List Container image data.

Future<Uint8List> getImageDataFromAssets(String path)async{
  try{
    final byteData = await rootBundle.load(path);
    final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return imageData;

  }catch (e){
    // Handle exception gracefully
    throw 'Error loading image data';
  }
}

/// Upload Image using ImageData on cloud Firebase Storage.
/// Returns the download URL of the uploaded image.

Future<String> uploadImageData(String path, Uint8List image, String name)async{
  try{
    final ref = _firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url = await ref.getDownloadURL();
    return url;
  }catch (e){
    // throw Exception gracefully
    if(e is FirebaseException){
      throw "Firebase Exception: ${e.message}";
    }else if(e is SocketException){
      throw 'network Error: ${e.message}';
    }else if(e is PlatformException){
      throw 'Platform Exception: ${e.message}';
    }else{
      throw 'Something is Wrong. Please Try again.';
    }
  }

}

// Upload image on cloud FireStore Storage
// Return the download URL of the uploaded image.
Future<String> uploadImageFile(String path,XFile image) async {
  try{
    final ref = _firebaseStorage.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }catch (e){
    // Handle Exception gracefully
    if(e is FirebaseException){
      throw "Firebase Exception: ${e.message}";
    }else if(e is SocketException){
      throw 'network Error: ${e.message}';
    }else if(e is PlatformException){
      throw 'Platform Exception: ${e.message}';
    }else{
      throw 'Something is Wrong. Please Try again.';
    }
  }
}

}