import 'package:flawless_beauty/feature/authentication/screens/Password_configuration/forget_password.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/signup.dart';
import 'package:flawless_beauty/navigation_menu.dart';
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
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(prefix: Icon(Iconsax.direct_right),label: Text(TTexts.email)),
            ),
            const SizedBox(height: TSize.spaceBtwInputFields,),
            TextFormField(
              decoration: const InputDecoration(prefix: Icon(Iconsax.password_check),label: Text(TTexts.password),suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: TSize.spaceBtwInputFields/2),

            // Remember me  & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(TTexts.RememberMe)

                  ],
                ),

                ///Forget Password
                TextButton(onPressed: ()=> Get.to(const ForgetPassword()), child: Text(TTexts.forget)),

              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            ///Sign in Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(const NavigationMenu()),child:  const Text(TTexts.SignIN),),),

            const SizedBox(height: TSize.spaceBtwItems),

            //Created  Account Button
            SizedBox(width: double.infinity,child: OutlinedButton(onPressed: ()=> Get.to(()=> const SignupScreen()),child:const Text(TTexts.createdAccount),),),
          ],
        ),
      ),
    );
  }
}
