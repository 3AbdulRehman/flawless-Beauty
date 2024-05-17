import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/help_function.dart';
import '../Rounded_Conatiner/rounded_container.dart';
import 't_brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product Count
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSize.spaceBtwItems),
          /// Brand Top 3 Product Image
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context){
    return Expanded(
        child: TRoundedContainer(
          height: 100,
          padding:  const EdgeInsets.all(TSize.md),
          margin: const EdgeInsets.only(right: TSize.sm),
          backgroundColor: THelpFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
          child:  Image(
              fit: BoxFit.contain,
              image: AssetImage(image)),
        )
    );
  }
}
