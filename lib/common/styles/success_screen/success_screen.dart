import 'package:flawless_beauty/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/text_String.dart';
import '../../../utils/helper/help_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //Image
              Image(image: AssetImage(image), width: THelpFunction.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBtwSections,),

              // Title
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItems,),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),

              const SizedBox(height: TSize.spaceBtwSections),

              //Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tcontinue)),),
            ],
          ),
        ),
      ),
    );
  }
}
