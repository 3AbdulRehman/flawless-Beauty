

import 'package:flawless_beauty/feature/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/constant.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/constants/text_String.dart';
import '../../../../../utils/helper/help_function.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelpFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 15,height: 15,
            child: Obx(()=> Checkbox(
              activeColor: TColors.primary,
                value: controller.privacyPolicy.value ,
                onChanged: (value)=> controller.privacyPolicy.value = !controller.privacyPolicy.value),
            )
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: TTexts.isAgree,style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: TTexts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white :TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white :TColors.primary,
                  )),
                  TextSpan(text: TTexts.and,style: Theme.of(context).textTheme.bodySmall),

                  TextSpan(text: TTexts.termOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white :TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white :TColors.primary,

                  )),

                ]
            )
        )
      ],
    );
  }
}
