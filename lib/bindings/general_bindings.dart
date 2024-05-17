

import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());

  }
}