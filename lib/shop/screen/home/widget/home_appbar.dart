import 'package:flutter/material.dart';

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
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          Text(TTexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),

        ],
      ),
      action: [
        TCartCounterIcon(onpressed: () { },iconColor: TColors.white,)
      ],
    );
  }
}
