import 'package:flawless_beauty/common/styles/image/t_circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/help_function.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image;
  final String title;
  final Color textColor;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItems),
        child: Column(
          children: [
            // Circular Icons
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSize.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelpFunction.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
            ),
            const SizedBox(height: TSize.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Center(
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: textColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ))
          ],
        ),
      ),
    );
  }
}
