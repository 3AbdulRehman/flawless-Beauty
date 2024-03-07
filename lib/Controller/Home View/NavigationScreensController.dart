

import 'package:flawless_beauty/View/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screen = [ Home(),
    Container(color: Colors.grey),
    Container(color: Colors.blue),
    Container(color: Colors.green),





  ];
}