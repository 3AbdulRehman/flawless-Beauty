import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/shop/models/category/category_model.dart';
import 'package:flawless_beauty/utils/exceptions/firebase_exceptions.dart';
import 'package:flawless_beauty/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../services/firebase_storage_service/firebase_storage_service.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();


  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all Category
  Future<List<CategoryModel>> getAllCategories ()async{
    try{
     final snapshot = await _db.collection('categories').get();
     final list = snapshot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
     return list;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }
 /// Get all Sub Category

 /// upload Category to the cloud Firebase.
 Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
      // Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for(var category in categories){

        // Get ImageData link from the local assets
       final file = await storage.getImageDataFromAssets(category.image);

       // upload image and Get its URL
        final url = await storage.uploadImageData('categories', file, category.name);

        // Assign Category .image attribute
        category.image  = url;

        // Store Category in FireStore
        await _db.collection('categories').doc(category.id).set(category.toJson());

      }
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something is Wrong. Please try again';
    }
 }

}