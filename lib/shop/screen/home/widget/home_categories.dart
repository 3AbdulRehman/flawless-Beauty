import 'package:flutter/material.dart';

import '../../../../common/styles/image_Text_widget/vertical_image_text.dart';
import '../../../../utils/constants/image_String.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return   TVerticalImageText(image: TImage.facebook,title: 'Facebook', onTap: (){},);

          }
      ),
    );
  }
}
