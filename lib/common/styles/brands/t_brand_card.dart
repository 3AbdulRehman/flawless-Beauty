import 'package:flawless_beauty/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/image_String.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/help_function.dart';
import '../Rounded_Conatiner/rounded_container.dart';
import '../image/t_circular_image.dart';
import '../text/t_brand_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child:TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: TCircularImage(
                image: brand.image,
                backgroundColor: Colors.transparent,
                isNetworkImage: true,
                overlayColor: THelpFunction.isDarkMode(context) ? TColors.white :TColors.black,
              ),
            ),
            const SizedBox(height: TSize.spaceBtwItems/2),

            /// Text
            // Expanded and Colum [MainAxisSize.min] is important to keeep the element in the Verticial center and also
            // keep text inside the boundaries
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TBrandTitleWithVerifiedIcon(title: brand.name,brandTextSize: TextSizes.large),
                    Text("${brand.productsCount ?? 0} products",style: Theme.of(context).textTheme.labelMedium,)

                  ],
                )

            )
          ],
        ),
      )
      ,
    );
  }
}
