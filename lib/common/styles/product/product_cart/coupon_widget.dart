import 'package:flutter/material.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/help_function.dart';
import '../../Rounded_Conatiner/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSize.sm,bottom: TSize.sm,right: TSize.sm,left: TSize.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration:  const InputDecoration(
                hintText: ' Have a Promo  code ? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(width: 60,child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1))
            ), child: const Text('Apply'),
          ),
          )
        ],
      ),

    );
  }
}
