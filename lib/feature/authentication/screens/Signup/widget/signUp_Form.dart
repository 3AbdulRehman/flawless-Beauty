import 'package:flawless_beauty/feature/authentication/controllers/signup/signup_controller.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/widget/terms_condition_checkbox.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
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
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                    validator: (value)=> TValidator.ValidateEmptyText('First Name', value),
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
              const SizedBox(width: TSize.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                    validator: (value)=> TValidator.ValidateEmptyText('Last Name', value),
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user))),
              ),
            ],
          ),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //UserName
          TextFormField(
              controller: controller.username,
              validator: (value)=> TValidator.ValidateEmptyText('UserName', value),
              expands: false,
              decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Email
          TextFormField(
              controller: controller.email,
              validator: (value)=> TValidator.validateEmail(value),
              decoration: const InputDecoration(labelText: TTexts.signupEmail, prefixIcon: Icon(Iconsax.direct))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Phone Number
          TextFormField(
            controller: controller.phoneNumber,
              validator: (value)=> TValidator.validationPhoneNumber(value),
              decoration: const InputDecoration(
                  labelText: TTexts.signupPhone,
                  prefixIcon: Icon(Iconsax.call))),

          const SizedBox(height: TSize.spaceBtwInputFields),

          //Password
          Obx(
              ()=> TextFormField(
                controller: controller.password,
                validator: (value)=> TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration:  InputDecoration(
                    labelText: TTexts.signUpPassword,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
                )
            ),
          ),

          const SizedBox(height: TSize.spaceBtwInputFields),

          // Terms of Condition Checked
          const TTermsAndConditionCheckbox(),

          const SizedBox(height: TSize.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
                ),
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createdAccount)),
          )
        ],
      ),
    );
  }
}
