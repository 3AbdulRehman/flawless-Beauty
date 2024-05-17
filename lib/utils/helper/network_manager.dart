


import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Manager the network connectivity status and provider methods to check and handle connectivity changes
class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network Manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    //_connectivitySubscription =  _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// update the connection status based on changes in connectivity and show  a relevant popup for no internet connection

Future<void> _updateConnectionStatus(ConnectivityResult result)async{
  _connectionStatus.value = result;
  if(_connectionStatus.value == ConnectivityResult.none){
    TLoader.customToast(message: 'No Internet Connection');
  }
}

/// Check the Internet Connection Status
/// Return 'True' if connected , 'False' otherwise
  Future<bool>isConnected()async{
    try{
      final result = await _connectivity.checkConnectivity();

      if(result == ConnectivityResult.none){
        return false;
      }else{
        return true;
      }
    }on PlatformException {
      return false;
    }
  }

/// Dispose or close the active connectivity stream.
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}

///advnace me rakhy hai
/*
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.cast<ConnectivityResult>().listen((event) {
          _updateConnectionStatus(event);
        });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoader.warningSnackBar(title: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
*/
