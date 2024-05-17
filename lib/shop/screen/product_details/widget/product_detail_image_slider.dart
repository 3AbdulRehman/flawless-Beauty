import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/styles/appbar/appbar.dart';
import '../../../../common/styles/icons/t_circular_icon.dart';
import '../../../../common/styles/image/t_rounded_image.dart';
import '../../../../common/styles/widget_login_signuo/Custom_shap/Curve_edge/curved_Edges_widget.dart';
import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/image_String.dart';
import '../../../../utils/constants/size.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(TImage.productImage1))),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSize.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: TSize.spaceBtwItems),
                    itemBuilder: (_, index) => TRoundedImage(
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSize.sm),
                        imageUrl: TImage.productImage1)),
              ),
            ),

            /// App Icons
            const TAppBar(
              showBackArrow: true,
              action: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
