import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flawless_beauty/admin_panel/add_product/add_product_model.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';

class AddProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    String fileName = imageFile.path.split('/').last;
    Reference ref = _storage.ref().child('productImages/$fileName');
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> addProduct(AddProductModel product) async {
    final data =
        await _firestore.collection('AddProduct').add(product.toJson());
    if (data.id.isNotEmpty) {
      TLoader.successSnackBar(
          title: 'Success', message: 'Product Added Successfully');
    } else {
      TLoader.errorSnackBar(
          title: 'Error', message: 'Something went wrong. Please try again');
    }
  }

  Future<List<AddProductModel>> fetchProducts() async {
    QuerySnapshot snapshot = await _firestore.collection('AddProduct').get();
    return snapshot.docs
        .map((doc) => AddProductModel.fromJson(
            doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> deleteProduct(String docId) async {
    await _firestore.collection('AddProduct').doc(docId).delete();
  }
}
