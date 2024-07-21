import 'package:flawless_beauty/admin_panel/add_product/add_product_model.dart';
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/product/product_cards/product_card_vertical.dart';
import 'package:flawless_beauty/common/styles/product/product_cart/add_to_cart._button.dart';
import 'package:flawless_beauty/common/styles/shadows.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/shop/screen/home/widget/add_to_buy_button.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key, required this.product});

  final AddProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);

    /// Container with side Padding , Color , Edge , Radius and shadow
    return Container(
      //height: Get.height * 0.55,
      //width: Get.width * 0.45,
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
            height: Get.height * 0.21,
            //width: 180,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// Thumbnail image
                Center(
                  child: TRoundedImage(
                    imageUrl: product.imageUrl,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                ///Scale Tage
                Positioned(
                  top: 12,
                  left: 0,
                  child: TRoundedContainer(
                    radius: TSize.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text("offer",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black)),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 0,
                  child: TRoundedContainer(
                    radius: TSize.sm,
                    backgroundColor: TColors.primary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text(
                      "Organic",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: TSize.spaceBtwItems / 2),

          /// Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSize.sm),

            /// only Reason to use the [SizeBox] here is to make Colum full Width
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.productName, smallSize: true),
                  const SizedBox(height: TSize.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brandName),
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
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: TSize.sm, bottom: TSize.sm),
                      child: Text(
                        product.actualPrice.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: TSize.sm,
                        bottom: TSize.sm,
                      ),
                      child: TProductPriceText(
                        price: product.sellPrice.toString(),
                      ),
                    )
                  ],
                ),
              ),

              /// Add Button Cart
              GestureDetector(
                onTap: () {
                  Get.to(() => const AddToBuyButton(), arguments: [
                    product.productName,
                    product.brandName,
                    product.actualPrice,
                    product.sellPrice
                  ]);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSize.cardRadiusMd),
                      bottomRight: Radius.circular(TSize.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSize.IconXl * 1.2,
                    height: TSize.IconXl * 1.2,
                    child: Icon(
                      Iconsax.add,
                      color: TColors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
