import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        /// Sub Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("SubTotal",style: Theme.of(context).textTheme.bodySmall),
            Text("RS2300",style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2),

        /// shipping Fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodySmall),
            Text("RS300",style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2),

        /// Tax fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodySmall),
            Text("RS150",style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2),
        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodySmall),
            Text("RS300",style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],


    );
  }
}
