import 'package:flawless_beauty/common/styles/success_screen/success_screen.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/size.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Given Default Equal Space on all sides in all Screen
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: const AssetImage(TImage.deliveredEmailIllustration),
                width: THelpFunction.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              // Title
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              Text('support@flawlesssaloon.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSize.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                            () => SuccessScreen(
                             image: TImage.successEmailIllustration,
                              title: TTexts.yourAccountCreated,
                              subTitle: TTexts.yourAccountCreatedSubTitle,
                              onPressed: ()=> Get.to(const LoginScreen()),

                        ),
                    ),
                    child: const Text(TTexts.tcontinue)),
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
