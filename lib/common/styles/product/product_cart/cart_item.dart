import 'package:flutter/material.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/image_String.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/help_function.dart';
import '../../image/t_rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(imageUrl: TImage.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: THelpFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBtwItems),

        /// Title , Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Product'),
              const Flexible(child: ProductTitleText(title: 'Saloon APP this is my Good Product ',maxLines: 1)),

              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Colors',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green',style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Colors',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green',style: Theme.of(context).textTheme.bodyLarge),

                      ]
                  )
              )

            ],
          ),
        )
      ],
    );
  }
}
