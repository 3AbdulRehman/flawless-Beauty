import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/circular_container.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Curve_edge/curved_Edges_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/constant.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            // if {Size is Finite : is not True} Error occured
            children: [
              // Back Ground Custom Shape
              Positioned(top: -150,right: -250,child: TCircularContainer(backgroundColors: TColors.textWhite.withOpacity(0.1))),
              Positioned(top: 100,right: -300,child: TCircularContainer(backgroundColors: TColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
