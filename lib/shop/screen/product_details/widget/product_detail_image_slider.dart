import 'package:cached_network_image/cached_network_image.dart';
import 'package:flawless_beauty/common/styles/product/favourite_icon/favourite_icon.dart';
import 'package:flawless_beauty/shop/controller/product/image_controller.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/styles/appbar/appbar.dart';
import '../../../../common/styles/icons/t_circular_icon.dart';
import '../../../../common/styles/image/t_rounded_image.dart';
import '../../../../common/styles/widget_login_signuo/Custom_shap/Curve_edge/curved_Edges_widget.dart';
import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/size.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    final dark = THelpFunction.isDarkMode(context);

    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: TColors.primary),
                      ),
                    );
                  }),
                ),
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
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: TSize.spaceBtwItems),
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          return TRoundedImage(
                            width: 80,
                            backgroundColor:
                                dark ? TColors.dark : TColors.white,
                            border: Border.all(
                                color: imageSelected
                                    ? TColors.primary
                                    : Colors.transparent),
                            padding: const EdgeInsets.all(TSize.sm),
                            isNetworkImage: true,
                            imageUrl: images[index],
                            onPressed: () => controller
                                .selectedProductImage.value = images[index],
                          );
                        })),
              ),
            ),

            /// App Icons
             TAppBar(
              showBackArrow: true,
              action: [
                TFavouriteIcon(productId: product.id)
              ],
            )
          ],
        ),
      ),
    );
  }
}
