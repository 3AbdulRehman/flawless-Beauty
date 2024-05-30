import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/constant.dart';

class ExpertCard extends StatelessWidget {
  final String name;
  final String profession;
  final String rating;
  final VoidCallback? onPressed;
  final String imagePath;


  const ExpertCard({
    Key? key,
    required this.name,
    required this.profession,
    required this.rating,
     required this.onPressed,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.only(left: 15,right: 15,top: 15),
      child: Container(
        height: Get.height*0.2,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TColors.primary.withOpacity(0.8)
        ),
        child:  Stack(
          children: [
             Positioned(
              top : 20,
              left: 10,
              child: Text(name,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
             Positioned(
              top : 50,
              left: 12,
              child: Text(profession,style: const TextStyle(fontSize: 16,color: TColors.black),),
            ),
             Positioned(
              top : 75,
              left: 13,
              child: Text(rating.toString(),style: const TextStyle(fontSize: 15,color: TColors.white),),
            ),
            const Positioned(
                top : 75,
                left: 38,
                child: Icon(Iconsax.ranking_11,color: Colors.white,size: 18,)
            ),
            Positioned(
                top : 100,
                left: 8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjust padding as needed
                      backgroundColor: TColors.white,
                    ),
                    onPressed: onPressed, child: Text("Book Appointment",style: TextStyle(color: TColors.black.withOpacity(0.9)),))
            ),
            Positioned(
                top : 0,
                right:  4,
                bottom: 1,
                child: Image.asset(imagePath)
            ),





          ],
        ) ,

      ),
    );

  }
}
