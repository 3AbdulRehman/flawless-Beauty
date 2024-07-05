

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/data/repositories/banners/banner_repository.dart';
import 'package:flawless_beauty/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all Order Related to Current User
  Future<List<BrandModel>> getAllBrands()async{
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }


  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await  _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where the brandId is in the List of brandIds, FieldPath.documentId to query documents in collection
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId,whereIn: brandIds).limit(2).get();

      // Extract brand or other relevant data from the document
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }
}