import 'package:flawless_beauty/common/styles/text/t_brand_title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/size.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const  TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines =1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
     this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandTitleText(
                title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              brandTextSize: brandTextSize,
            )
        ),
        const SizedBox(width: TSize.xs),
         Icon(Iconsax.verify5, color: iconColor, size: TSize.Iconxs),
      ],
    );
  }
}
