import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/shop/screen/product_details/product_detail.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Rounded_Conatiner/rounded_container.dart';
import '../../icons/t_circular_icon.dart';
import '../../shadows.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);

    /// Container with side Padding , Color , Edge , Radius and shadow
    return GestureDetector(
      onTap: ()=> Get.to(()=> const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail , WishList Button, discount Tage
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  const TRoundedImage(imageUrl: TImage.productImage1, applyImageRadius: true),

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

                  /// Favorite Icon Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            const SizedBox(height: TSize.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSize.sm),
              /// only Reason to use the [SizeBox] here is to make Colum full Width
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(title: 'google logo icon ', smallSize: true),
                    SizedBox(height: TSize.spaceBtwItems /2),

                    TBrandTitleWithVerifiedIcon(title: 'google',),

                  ],
                ),
              ),
            ),
            /// Todo : Add Spacer() here to keep Height of each Box same in case 1 or 2 line of Heading
            const Spacer(),
            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: TSize.sm),
                  child: TProductPriceText(price: '5000',),
                ),

                /// Add Button Cart
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSize.cardRadiusMd),
                        bottomRight: Radius.circular(TSize.productImageRadius),
                      ),
                  ),
                  child: const SizedBox(
                    width: TSize.IconXl * 1.2,
                    height: TSize.IconXl * 1.2,
                    child: Center(
                        child: Icon(Iconsax.add, color: TColors.white)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

