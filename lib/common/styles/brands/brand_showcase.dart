import 'package:cached_network_image/cached_network_image.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/shop/models/brand_model.dart';
import 'package:flawless_beauty/shop/screen/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/help_function.dart';
import '../Rounded_Conatiner/rounded_container.dart';
import 't_brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images, required this.brand,
  });
  final BrandModel brand;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=> BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSize.md),
        margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Product Count
             TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSize.spaceBtwItems),
            /// Brand Top 3 Product Image
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ],
        ),
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
          child:  CachedNetworkImage(
            fit: BoxFit.contain,
              imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url ,error) => const Icon(Icons.error),
          )
        )
    );
  }
}
