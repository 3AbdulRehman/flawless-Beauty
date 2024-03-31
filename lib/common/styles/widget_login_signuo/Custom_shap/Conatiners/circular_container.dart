
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.margin,
    this.padding = 0,
    this.backgroundColors = TColors.white
  });

  final double ? height;
  final double ? width;
  final double  radius;
  final double padding;
  final EdgeInsets ? margin;
  final Widget ? child;
  final Color backgroundColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColors,
      ),
      child: child,
    );
  }
}
