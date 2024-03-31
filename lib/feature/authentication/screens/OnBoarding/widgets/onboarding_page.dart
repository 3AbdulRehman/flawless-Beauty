import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helper/help_function.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image,title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSize.defaultSpace),
      child: Column(
        children: [
          Image(
              width: THelpFunction.screenWidth()*0.8,
              height: THelpFunction.screenHeight()*0.6,
              image:  AssetImage(image)
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
          const SizedBox(height: TSize.spaceBtwItems,),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
