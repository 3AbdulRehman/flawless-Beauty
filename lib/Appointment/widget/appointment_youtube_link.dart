import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/help_function.dart';
import '../../common/styles/Rounded_Conatiner/rounded_container.dart';
import '../../common/styles/image/t_circular_image.dart';

class AppointmentYoutubeLink extends StatelessWidget {
  const AppointmentYoutubeLink({
    super.key,
    this.onTap, required this.name, required this.profession,
  });

  final String name;
  final String profession;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child:TRoundedContainer(
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: TCircularImage(image: "assets/appointment/youtube.png",height: 80,width: 80,
                backgroundColor: Colors.transparent,
                isNetworkImage: false,
                overlayColor: THelpFunction.isDarkMode(context) ? TColors.white :TColors.black,
              ),
            ),
             Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text(profession,style: const TextStyle(),maxLines: 2,overflow: TextOverflow.ellipsis,),

                  ],
                )

            )
          ],
        ),
      )
      ,
    );
  }
}
