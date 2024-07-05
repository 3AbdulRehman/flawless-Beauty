
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/product/favourite_icon/favourite_icon.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../shop/controller/product/product_controller.dart';
import '../../../../shop/models/product_model.dart';
import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/enum.dart';
import '../../../../utils/constants/size.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizental extends StatelessWidget {
  const TProductCardHorizental({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {

    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                /// Thumbnail Image
                 SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: product.thumbnail , applyImageRadius: true, isNetworkImage: true)
                ),
                ///Scale Tage
                if(salePercentage != null)
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSize.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text('{$salePercentage}%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                //// ./...... Remove this will
                /// Favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id ,)
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
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: product.title,smallSize: true,),
                      const SizedBox(height: TSize.spaceBtwItems/2),
                      TBrandTitleWithVerifiedIcon(title: product.brand!.name),

                    ],
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                          child: Column(
                            children: [
                              if(product.productType == ProductType.single.toString() && product.salePrice >0)

                                 Padding(
                                  padding: const EdgeInsets.only(left: TSize.sm),
                                  child: Text(product.price.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                              // Padding , Show sale price as main price if sale exist
                              Padding(
                                  padding: const EdgeInsets.only(left: TSize.sm),
                                child: TProductPriceText(price: controller.getProductPrice(product),),
                              )
                            ],
                          )),

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
