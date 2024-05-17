
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

class TBillingPaymentsSection extends StatelessWidget {
  const TBillingPaymentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return   Column(
      children: [
        TSectionHeading(title: "Payment Method",buttonTitle: 'Change',onPressed: (){},),
        const SizedBox(height: TSize.spaceBtwItems/2,),
        Row(
          children: [
            TRoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSize.sm),
              child: const Image(image: AssetImage(TImage.paypal),fit: BoxFit.contain),
            ),
            const SizedBox(width: TSize.spaceBtwItems / 2),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
