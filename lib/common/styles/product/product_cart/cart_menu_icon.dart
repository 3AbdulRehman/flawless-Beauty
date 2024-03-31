import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/constant.dart';


class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, required this.onpressed,  this.iconColor,
  });

  final VoidCallback onpressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onpressed, icon:  Icon(Iconsax.shopping_bag,color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: TColors.black,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Text('3',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: 0.8),),
              ),

            ))

      ],
    );
  }
}
