
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBordingController extends GetxController{

  static OnBordingController get instance => Get.find();

  // Variable
  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;

// Update Current Index when Page Scroll
void updatePageIndicator(index)=> currentPageIndex.value = index;

// Jump to the specific dot selected page.

void dotNavigationClick(index){
  currentPageIndex.value = index;
  pageController.jumpTo(index);
}

  //Update Current Index & Jump to next page
void nextPage(){
  if(currentPageIndex.value == 2){
    final storage = GetStorage();
    if(kDebugMode){
      print('==================== Get Storage Next Button =============');
      print(storage.read('IsFirstTime'));
    }

    storage.write('IsFirstTime', false);

    Get.offAll(const LoginScreen());
  }else{
    int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
  }
}

  ///Update Current Index & jump to the Last page
void skipPage(){
  currentPageIndex.value =2; // screen start form 0 thats why put 2
  pageController.jumpToPage(2);
}

}