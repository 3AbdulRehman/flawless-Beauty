

import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/product/product_cards/product_card_horizental.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Hair Cutting Style'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(width: double.infinity,imageUrl: TImage.haircutBanner,applyImageRadius: true),
              const SizedBox(height: TSize.spaceBtwSections),

              /// Sub Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: 'HairCutting',onPressed: (){}),
                  const SizedBox(height: TSize.spaceBtwItems/2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context,index) => const SizedBox(width: TSize.spaceBtwItems,),
                        itemBuilder: (context,index) => const TProductCardHorizental()),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
