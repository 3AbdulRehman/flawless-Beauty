import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/help_function.dart';
import '../../icons/t_circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSize.md,
          color: THelpFunction.isDarkMode(context) ? TColors.white : TColors.black,
          backgroundColor: THelpFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSize.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSize.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
