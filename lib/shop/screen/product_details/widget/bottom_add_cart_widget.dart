import 'package:flawless_beauty/common/styles/icons/t_circular_icon.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddCart extends StatelessWidget {
  const TBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSize.cardRadiusLg),
            topRight: Radius.circular(TSize.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white),
              const SizedBox(width: TSize.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSize.spaceBtwItems),
              const TCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSize.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black)),
              onPressed: () {},
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
