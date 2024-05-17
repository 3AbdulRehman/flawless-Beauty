
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){}),
        const Text('Faiza'),

        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16),
            const SizedBox(width: TSize.spaceBtwItems),
            Text('+92-33323232',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems/2),

        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16),
            const SizedBox(width: TSize.spaceBtwItems),
            Expanded(child: Text('ghulshani Iqbal, karachi, pk',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,))
          ],
        ),
      ],
    );
  }
}
