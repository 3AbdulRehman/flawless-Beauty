import 'package:flawless_beauty/common/styles/widget_login_signuo/TLoginFormDivider.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/TSocialMediaButton.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/widget/signUp_Form.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSize.spaceBtwSections),

              ///Form
              const TSignUpForm(),

              const SizedBox(height: TSize.spaceBtwSections),

              ///Divider
              TFormDivider(DividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(height: TSize.spaceBtwItems),
              //Social Media Button
              const TSocialMediaButton()
            ],
          ),
        ),
      ),
    );
  }
}

