import 'package:flawless_beauty/feature/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/constant.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

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

              SizedBox(
                height: TSize.imageCarouselHeight*1.3,
                  child: Lottie.asset(TImage.deliveredEmailIllustration)),

              const SizedBox(height: TSize.spaceBtwSections),

              // Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItems,),
              Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwSections),

              //Button
              SizedBox(width: double.infinity, child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
                  ),
                  onPressed: ()=> Get.offAll(()=>const LoginScreen()), child: const Text(TTexts.done)),),

              const SizedBox(height: TSize.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail)),),


            ],
          ),
        ),
      ),
    );
  }
}
