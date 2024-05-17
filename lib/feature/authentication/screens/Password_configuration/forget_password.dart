
import 'package:flawless_beauty/feature/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/constant.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return  Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            // Heading
            Text(TTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSize.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSize.spaceBtwSections*2),

            // Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            //Submit Button

            SizedBox( width: double.infinity ,child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
                ),
                onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(TTexts.submit)))
          ],
        ),
      ),

    );
  }
}
