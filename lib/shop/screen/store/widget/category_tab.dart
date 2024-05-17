import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/product/product_cards/product_card_vertical.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/brands/brand_showcase.dart';
import '../../../../utils/constants/image_String.dart';
import '../../../../utils/constants/size.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// ---Brands
              const TBrandShowCase(images: [TImage.productImage1, TImage.productImage2, TImage.productImage3],),
              const TBrandShowCase(images: [TImage.productImage1, TImage.productImage2, TImage.productImage3],),



              const SizedBox(height: TSize.spaceBtwItems),

              ///  Products
              TSectionHeading(
                  title: 'You Might like',
                  showActionButton: true,
                  onPressed: () {}),
              const SizedBox(height: TSize.spaceBtwItems),

              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const TProductCardVertical()),
              const SizedBox(height: TSize.spaceBtwSections),
            ],
          ),
        )
      ],
    );
  }
}
