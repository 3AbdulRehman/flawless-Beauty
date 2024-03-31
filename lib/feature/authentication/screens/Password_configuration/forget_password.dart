

import 'package:flawless_beauty/feature/authentication/screens/Password_configuration/reset_password.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            // Heading
            Text(TTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSize.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSize.spaceBtwSections*2),

            // Text Field
            TextFormField(
              decoration: InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            //Submit Button

            SizedBox( width: double.infinity ,child: ElevatedButton(onPressed: ()=> Get.off(()=>const ResetPassword()), child: const Text(TTexts.submit)))
          ],
        ),
      ),

    );
  }
}
