import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:flawless_beauty/shop/models/bannner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variable
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Upload Banners to the Cloud FireStore
  Future<String> uploadBannerImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = _storage.ref().child('banners/$fileName');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw 'Error uploading image: $e';
    }
  }

  Future<void> saveBannerUrl(String imageUrl) async {
    try {
      await _db.collection('Banners').add({
        'ImageUrl': imageUrl,
        'Active': true,
      });
    } catch (e) {
      throw 'Error saving banner URL: $e';
    }
  }

  Future<void> deleteBanner(String imageUrl, String docId) async {
    try {
      // Delete image from Firebase Storage
      Reference ref = _storage.refFromURL(imageUrl);
      await ref.delete();

      // Delete document from Firestore
      await _db.collection('Banners').doc(docId).delete();
    } catch (e) {
      throw 'Error deleting banner: $e';
    }
  }
}
