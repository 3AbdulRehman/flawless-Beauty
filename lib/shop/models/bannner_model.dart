

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {

  final String imageurl;  // video have not final
  final String targetScreen;
  final bool active;

  BannerModel({required this.imageurl,required this.targetScreen, required this.active});

  Map<String, dynamic>toJson(){
    return {
      'ImageUrl' : imageurl,
      'TargetScreen' : targetScreen,
      'Active' : active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        imageurl: data['ImageUrl']?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
    );
  }
}