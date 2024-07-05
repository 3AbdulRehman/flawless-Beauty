import 'package:flawless_beauty/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/help_function.dart';
import '../../image/t_rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: THelpFunction.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBtwItems),

        /// Title , Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName!),
              Flexible(
                  child: ProductTitleText(title: cartItem.title, maxLines: 1)),

              /// Attributes
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: '${e.key}',
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(text: '${e.key}', style: Theme.of(context).textTheme.bodyMedium),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
