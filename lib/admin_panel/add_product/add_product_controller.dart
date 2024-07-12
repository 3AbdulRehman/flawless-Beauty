import 'dart:io';

import 'package:flawless_beauty/admin_panel/add_product/add_product_model.dart';
import 'package:flawless_beauty/admin_panel/add_product/add_product_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  final AddProductRepository _repository = AddProductRepository();
  var products = <AddProductModel>[].obs;

  var productName = ''.obs;
  var brandName = ''.obs;
  var actualPrice = 0.0.obs;
  var sellPrice = 0.0.obs;
  var imageUrl = ''.obs;
  var imageFile = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> uploadProduct() async {
    if (imageFile.value != null) {
      imageUrl.value = await _repository.uploadImage(imageFile.value!);
      AddProductModel product = AddProductModel(
        productName: productName.value,
        brandName: brandName.value,
        actualPrice: actualPrice.value,
        sellPrice: sellPrice.value,
        imageUrl: imageUrl.value,
      );
      await _repository.addProduct(product);
      clearFields();
      fetchProducts();
    }
  }

  void clearFields() {
    productName.value = '';
    brandName.value = '';
    actualPrice.value = 0.0;
    sellPrice.value = 0.0;
    imageFile.value = null;
    imageUrl.value = '';
  }

  Future<void> fetchProducts() async {
    products.value = await _repository.fetchProducts();
  }

  Future<void> deleteProduct(String docId) async {
    await _repository.deleteProduct(docId);
    fetchProducts();
  }
}
