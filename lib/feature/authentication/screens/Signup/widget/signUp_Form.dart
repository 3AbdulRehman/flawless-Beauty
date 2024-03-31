import 'package:flawless_beauty/feature/authentication/screens/Signup/verify_email.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/widget/terms_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/constants/text_String.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
              const SizedBox(width: TSize.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
            ],
          ),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //UserName
          TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.username, prefixIcon: Icon(Iconsax.user))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Email
          TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.signupEmail,
                  prefixIcon: Icon(Iconsax.direct))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Phone Number
          TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.signupPhone,
                  prefixIcon: Icon(Iconsax.call))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Password
          TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: TTexts.signUpPassword,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          // Terms of Condition Checked
          const TTermsAndConditionCheckbox(),

          const SizedBox(height: TSize.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: const Text(TTexts.createdAccount)),
          )
        ],
      ),
    );
  }
}
