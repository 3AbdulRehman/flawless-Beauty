import 'package:flawless_beauty/shop/controller/product/variation_controller.dart';
import 'package:flawless_beauty/utils/helper/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
