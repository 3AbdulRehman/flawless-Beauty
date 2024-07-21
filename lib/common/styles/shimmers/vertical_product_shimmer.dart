import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        crossAxisCount: 2,
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image
                  TShimmerEffect(width: 180, height: 180),
                  SizedBox(height: TSize.spaceBtwItems),

                  TShimmerEffect(width: 160, height: 15),
                  SizedBox(height: TSize.spaceBtwItems / 2),

                  TShimmerEffect(width: 110, height: 15)
                ],
              ),
            ));
  }
}
