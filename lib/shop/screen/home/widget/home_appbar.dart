import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/appbar/appbar.dart';
import '../../../../common/styles/product/product_cart/cart_menu_icon.dart';
import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/text_String.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a Shimmer Loader while user Profile is being loaded
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white));
            }
          }),
        ],
      ),
      action: [
        TCartCounterIcon(
          onpressed: () {},
          iconColor: TColors.white,
          counterByColor: TColors.black,
          counterByTextColor: TColors.white,
        )
      ],
    );
  }
}
