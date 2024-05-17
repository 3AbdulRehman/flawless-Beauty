import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_circular_image.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSize.spaceBtwItems),

            /// Price
            Text('RS3000',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSize.spaceBtwItems),
            const TProductPriceText(price: '2500',isLarge: true,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/1.5),
        ///Title
        const ProductTitleText(title: 'Good Product in the Saloon Application'),
        const SizedBox(height: TSize.spaceBtwItems/1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSize.spaceBtwItems),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: TSize.spaceBtwItems/1.5),

        ///Brand
        Row(
          children: [
            TCircularImage(
                image: TImage.comestic,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(title: 'Google',brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
