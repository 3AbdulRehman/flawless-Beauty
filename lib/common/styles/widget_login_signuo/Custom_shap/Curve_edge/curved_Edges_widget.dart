import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Curve_edge/curved_Edges.dart';
import 'package:flutter/material.dart';


class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdge(),
      child: child,
    );
  }
}
