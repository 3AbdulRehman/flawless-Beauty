import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  /// A Custom Circular Icon Widget with a background color.
  ///
  /// Properties area
  /// Conatiner [width], [height] & [backgroundColor]
  ///
  /// Icon`s [Size] ,[Color] & [onPressed]
  const TCircularIcon(
      {super.key,
      this.width,
      this.height,
      this.size = TSize.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor! : THelpFunction.isDarkMode(context) ?TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: color,size: size)),
    );
  }
}
