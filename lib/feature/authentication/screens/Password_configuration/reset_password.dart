import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helper/help_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(TImage.deliveredEmailIllustration), width: THelpFunction.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBtwSections,),

              // Title & SubTitle
              Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItems,),
              Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),

              const SizedBox(height: TSize.spaceBtwSections),

              //Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.done)),),
              const SizedBox(height: TSize.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail)),),


            ],
          ),
        ),
      ),
    );
  }
}
