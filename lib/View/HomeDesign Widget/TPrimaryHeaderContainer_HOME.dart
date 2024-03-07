import 'package:flutter/material.dart';

import '../../constant.dart';
import 'TCircularShape.dart';
import 'TCurveEdges.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCircularEdgeWidget(
      child: Container(
        color: ThemeColor,
        padding:  EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(top:-150, right: -250,      child: TCircularContainer(backgroundColors: ThemeColor2.withOpacity(0.4),)),
              Positioned(top: 100, right: -300,      child: TCircularContainer(backgroundColors: ThemeColor2.withOpacity(0.4))),
            ],
          ),
        ),
      ),
    );
  }
}
