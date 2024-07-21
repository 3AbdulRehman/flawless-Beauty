import 'package:cloud_firestore/cloud_firestore.dart';

class FormBuyProductModel {
  final String? id;
  final String productName;
  final String brandName;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String userName;
  final int actualPrice;
  final int sellPrice;

  FormBuyProductModel({
    this.id,
    required this.productName,
    required this.brandName,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.userName,
    required this.actualPrice,
    required this.sellPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'brandName': brandName,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'userName': userName,
      'actualPrice': actualPrice,
      'sellPrice': sellPrice,
    };
  }

  factory FormBuyProductModel.fromJson(DocumentSnapshot json) {
    return FormBuyProductModel(
      id: json.id,
      productName: json['productName'] ?? '',
      brandName: json['brandName'],
      phoneNumber: json['phoneNumber'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
      userName: json['userName'] ?? '',
      actualPrice: json['actualPrice'] ?? '',
      sellPrice: json['sellPrice'] ?? '',
    );
  }
}
// Map<String, dynamic> toJson() {
//     return {
//       'ImageUrl': imageUrl,
//       'TargetScreen': targetScreen,
//       'Active': active,
//     };
//   }

//   factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return BannerModel(
//       docId: snapshot.id, // Get document ID
//       imageUrl: data['ImageUrl'] ?? '',
//       targetScreen: data['TargetScreen'] ?? '',
//       active: data['Active'] ?? false,
//     );
//   }