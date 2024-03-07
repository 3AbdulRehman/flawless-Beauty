import 'package:flawless_beauty/constant.dart';
import 'package:flutter/material.dart';

import 'HomeDesign Widget/TCircularShape.dart';
import 'HomeDesign Widget/TCurveEdges.dart';
import 'HomeDesign Widget/TCustomCurvedWidget.dart';
import 'HomeDesign Widget/TPrimaryHeaderContainer_HOME.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double responsiveTextSize(double fontSize) {
      // Calculate responsive font size
      return fontSize * (w / 414); // 414 is a reference screen width
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



