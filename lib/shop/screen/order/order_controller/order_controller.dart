import 'package:flawless_beauty/shop/screen/home/widget/model/form_buy_product_model.dart';
import 'package:flawless_beauty/shop/screen/order/order_repository/order_repository.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepository _repository = OrderRepository();
  final RxList<FormBuyProductModel> products = <FormBuyProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final data = await _repository.fetchProducts();
      products.value = data;
      isLoading.value = false;
    } catch (e) {
      print("Failed to fetch products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _repository.deleteProduct(id);
      products.removeWhere((product) => product.id == id);
      TLoader.successSnackBar(
          title: 'Success', message: 'Product deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product');
    }
  }
}
