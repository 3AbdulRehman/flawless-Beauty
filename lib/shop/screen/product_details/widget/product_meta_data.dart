import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_circular_image.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/shop/controller/product/product_controller.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelpFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & SAles Price
        Row(
          children: [
            /// Sale Tage
            TRoundedContainer(
              radius: TSize.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSize.sm,vertical: TSize.xs),
              child: Text('$salePercentage%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSize.spaceBtwItems),

            /// Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text('\RS${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: TSize.spaceBtwItems),
              TProductPriceText(price: controller.getProductPrice(product),isLarge: true,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/1.5),
        ///Title
         ProductTitleText(title: product.title),
        const SizedBox(height: TSize.spaceBtwItems/1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSize.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: TSize.spaceBtwItems/1.5),

        ///Brand
        Row(
          children: [
            TCircularImage(
                image: product.brand != null ? product.brand!.image : '' ,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
             TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : ' ',brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
