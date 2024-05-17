import 'package:flawless_beauty/feature/authentication/controllers/login/login_controller.dart';
import 'package:flawless_beauty/feature/authentication/screens/Password_configuration/forget_password.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/signup.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/constants/text_String.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value)=>TValidator.validateEmail(value),
              decoration: const InputDecoration(prefix: Icon(Iconsax.direct_right),label: Text(TTexts.email)),
            ),

            const SizedBox(height: TSize.spaceBtwInputFields),

            ///Password
            Obx(
                  ()=> TextFormField(
                  controller: controller.password,
                  validator: (value)=> TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration:  InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                          icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
                  )
              ),
            ),
            const SizedBox(height: TSize.spaceBtwInputFields/2),

            // Remember me  & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value)
                    ),
                    const Text(TTexts.RememberMe)

                  ],
                ),

                ///Forget Password
                TextButton(onPressed: ()=> Get.to(const ForgetPassword()), child: const Text(TTexts.forget)),

              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            ///Sign in Button
            SizedBox(width: double.infinity,child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
              ),
              onPressed: ()=> controller.emailAndPasswordSignIn(),child:  const Text(TTexts.SignIN),),),

            const SizedBox(height: TSize.spaceBtwItems),

            //Created  Account Button
            SizedBox(width: double.infinity,child: OutlinedButton(onPressed: ()=> Get.to(()=> const SignupScreen()),child:const Text(TTexts.createdAccount),),),
          ],
        ),
      ),
    );
  }
}
