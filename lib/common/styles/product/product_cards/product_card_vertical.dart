import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/product/favourite_icon/favourite_icon.dart';
import 'package:flawless_beauty/common/styles/product/product_cart/add_to_cart._button.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/screen/product_details/product_detail.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shop/controller/product/product_controller.dart';
import '../../Rounded_Conatiner/rounded_container.dart';
import '../../shadows.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelpFunction.isDarkMode(context);

    /// Container with side Padding , Color , Edge , Radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
              width: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  Center(
                      child: TRoundedImage(
                          imageUrl: product.thumbnail,
                          applyImageRadius: true,
                          isNetworkImage: true)),

                  ///Scale Tage
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSize.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSize.sm, vertical: TSize.xs),
                        child: Text("$salePercentage%",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black)),
                      ),
                    ),

                  /// Favorite Icon Button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: TFavouriteIcon(
                        productId: product.id,
                      )),
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
                    ProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: TSize.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: product.brand!.name),
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
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSize.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSize.xs),
                        child: TProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      )
                    ],
                  ),
                ),

                /// Add Button Cart
                ProductCardAddToCartButton(
                  product: product,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
