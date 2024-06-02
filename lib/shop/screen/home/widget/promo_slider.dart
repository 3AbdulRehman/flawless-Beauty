import 'package:carousel_slider/carousel_slider.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/shop/controller/banner_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/image/t_rounded_image.dart';
import '../../../../common/styles/widget_login_signuo/Custom_shap/Conatiners/circular_container.dart';
import '../../../../utils/constants/size.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return  Obx((){
      // Loader
      if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);
      // No data Found
      if(controller.banners.isEmpty){
        return const Center(child: Text('No Data Found!'));
      }else{
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(viewportFraction: 1, onPageChanged: (index,_) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners.map((banner) => TRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: ()=> Get.toNamed(banner.targetScreen))).toList(),
            ),
            const SizedBox(height: TSize.spaceBtwItems),
            Center(
              child: Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
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
    );
  }
}
