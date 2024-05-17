
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/size.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizental extends StatelessWidget {
  const TProductCardHorizental({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child:  Stack(
              children: [
                /// Thumbail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImage.hairAsymmetrical, applyImageRadius: true)
                ),
                ///Scale Tage
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSize.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text('25', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                //// ./...... Remove this will
                /// Favorite Icon Button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red)
                ),

              ],
            ),
          ),

          /// Detail
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm,left: TSize.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: "We have Expert Hair Cutter",smallSize: true,),
                      SizedBox(height: TSize.spaceBtwItems/2),
                      TBrandTitleWithVerifiedIcon(title: "Flawless"),

                    ],
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '450')),

                      /// Add Cart /// no Need here
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSize.cardRadiusMd),
                            bottomRight:Radius.circular(TSize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSize.IconLg * 1.2,
                            height: TSize.IconLg*1.2,
                            child: Center(child: Icon(Iconsax.add,color: TColors.white))

                        ),
                      ),


                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
