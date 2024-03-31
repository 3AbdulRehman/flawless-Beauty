import 'package:flawless_beauty/common/styles/spacing_styles.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/widget/login_form.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/widget/login_header.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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




