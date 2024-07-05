import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String? docId; // Document ID from Firestore
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    this.docId,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      docId: snapshot.id, // Get document ID
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
