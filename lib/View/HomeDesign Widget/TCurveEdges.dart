
import 'package:flutter/material.dart';

import 'TCustomCurvedWidget.dart';

class TCircularEdgeWidget extends StatelessWidget {
  const TCircularEdgeWidget({
    super.key,
    this.child
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper:TCustomCurvedEdge() ,
        child: child
    );
  }
}
