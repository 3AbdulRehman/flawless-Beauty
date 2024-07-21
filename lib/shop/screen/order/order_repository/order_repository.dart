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
}
// Future<List<BannerModel>> fetchBanners() async {
//     try {
//       final result = await _db
//           .collection('Banners')
//           .where('Active', isEqualTo: true)
//           .get();
//       return result.docs
//           .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
//           .toList();
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again.';
//     }
//   }
