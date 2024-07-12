import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/admin_panel/add_product/add_product_model.dart';
import 'package:flawless_beauty/utils/exceptions/firebase_exceptions.dart';
import 'package:flawless_beauty/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../shop/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// FireStore instance for the database interaction
  final _db = FirebaseFirestore.instance;

  Future<List<AddProductModel>> fetchProducts() async {
    QuerySnapshot snapshot = await _db.collection('AddProduct').get();
    return snapshot.docs
        .map((doc) => AddProductModel.fromJson(
            doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  /// Get Limited featured products
  Future<List<AddProductModel>> fetchAddProductsData() async {
    try {
      final snapshot = await _db.collection("AddProduct").get();
      return snapshot.docs
          .map((e) => AddProductModel.fromJson(e.data(), e.id))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

  /// Get Limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

// Get Product based on Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

  Future<List<ProductModel>> getProductSForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

  Future<List<ProductModel>> getProductSForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Extract ProductIds from the document
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all document where the brandId is in the list of brandIds. FieldPath.documentId to query document in collection
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand name or other relevant data from the document
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went Wrong, Please try again";
    }
  }

// /// Upload Dummy Data to the Cloud FireStoreL
  // Future<void> uploadDummyData(List<ProductModel> products) async {
  //   try {
  //     // Upload all the products along with their images
  //     final storage = Get.put(TFirebaseStorageService());
  //
  //     // Loop through each product
  //     for (var product in products) {
  //       // Get image data link from local assets
  //       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
  //
  //       // Upload image and get its URL
  //       final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
  //
  //       // Assign URL to product.thumbnail attribute
  //       product.thumbnail = url;
  //
  //       // Product list of images
  //       if (product.images != null && product.images!.isNotEmpty) {
  //         List<String> imagesUrl = [];
  //
  //         for (var image in product.images!) {
  //           // Get image data link from local assets
  //           final assetImage = await storage.getImageDataFromAssets(image);
  //           // Upload image and get its URL
  //           final url = await storage.uploadImageData('Products/Images', assetImage, image);
  //
  //           // Assign URl to Product .thumbnail attributes
  //           imagesUrl.add(url);
  //         }
  //         product.images!.clear();
  //         product.images!.addAll(imagesUrl);
  //       }
  //       // Upload Variation Image
  //       if (product.productType == ProductType.variable.toString()) {
  //         for (var variation in product.productVariations!) {
  //           // Get image data link from local assets
  //           final assetImage = await storage.getImageDataFromAssets(variation.image);
  //
  //           // upload image and get its url
  //           final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);
  //
  //
  //           // Assign URL to variation image attributes
  //           variation.image = url;
  //         }
  //       }
  //
  //       // Store product in FireStore
  //       await _db.collection("Products").doc(product.id).set(product.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } on SocketException catch (e) {
  //     throw e.message;
  //   } on PlatformException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}
