import 'package:flawless_beauty/common/styles/spacing_styles.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/widget/login_form.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/widget/login_header.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/widget_login_signuo/TLoginFormDivider.dart';
import '../../../../common/styles/widget_login_signuo/TSocialMediaButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return   const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
            //logo , Title, SubTitle
            TLoginHeader(),

            //Form
            TLoginForm(),
              ///Devider
              TFormDivider(DividerText: TTexts.orSignInWith),

              SizedBox(width: TSize.spaceBtwSections,),
              //Footer 
               TSocialMediaButton(),

            ],
          ),
          ),
        
      ),
    );
  }
}




