import 'package:carousel_slider/carousel_slider.dart';
import 'package:flawless_beauty/shop/controller/home_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/image/t_rounded_image.dart';
import '../../../../common/styles/widget_login_signuo/Custom_shap/Conatiners/circular_container.dart';
import '../../../../utils/constants/image_String.dart';
import '../../../../utils/constants/size.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSize.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                   TCircularContainer(
                      width: 20,
                      height: 4,
                      margin:  const EdgeInsets.only(right: 10),
                      backgroundColors: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
