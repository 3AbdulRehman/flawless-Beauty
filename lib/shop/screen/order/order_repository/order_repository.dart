import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/shop/screen/home/widget/model/form_buy_product_model.dart';

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<FormBuyProductModel>> fetchProducts() async {
    try {
      final collection = await _firestore.collection('Buyer');
      final snapshot = await collection.get();
      return snapshot.docs
          .map((doc) => FormBuyProductModel.fromJson(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _firestore.collection('Buyer').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }
}
