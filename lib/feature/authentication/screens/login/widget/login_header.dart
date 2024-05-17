import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_String.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/constants/text_String.dart';
import '../../../../../utils/helper/help_function.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 165,
            //width: 150,
            image: AssetImage(dark? TImage.lightAppLogo : TImage.darkAppLogo)
        ),

        Text(TTexts.loginTitle,style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: TSize.sm,),
        Text(TTexts.loginSubTitle,style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}