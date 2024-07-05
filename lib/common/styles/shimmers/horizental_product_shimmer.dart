
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class THorizentalProductShimmer extends StatelessWidget {
  const THorizentalProductShimmer({super.key,
     this.itemCount = 4
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index)=>const SizedBox(width: TSize.spaceBtwItems),
        itemBuilder: (_,__) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSize.spaceBtwItems),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSize.spaceBtwItems /2),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSize.spaceBtwItems /2),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSize.spaceBtwItems /2),
                TShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )

          ],
        ),
                ),
    );
  }
}
