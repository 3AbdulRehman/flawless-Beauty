import 'package:flutter/material.dart';

import 'curves_edges.dart';


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
