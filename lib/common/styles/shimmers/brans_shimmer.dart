import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flutter/material.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        crossAxisCount: 2,
        itemCount: itemCount,
        mainAxisExtent: 80,
        itemBuilder: (_, index) =>
            const TShimmerEffect(width: 300, height: 80));
  }
}
