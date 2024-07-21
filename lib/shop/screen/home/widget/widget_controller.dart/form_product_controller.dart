import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/shop/screen/home/widget/model/form_buy_product_model.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormProductController extends GetxController {
  static FormProductController get to => Get.find();

  final currentUser = UserController.instance;
  late final String productName;
  late final String brandName;
  late final int actualPrice;
  late final int sellPrice;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  get nameCurrent => currentUser.user.value.fullName;

  @override
  void onInit() {
    final arguments = Get.arguments;
    super.onInit();
    productName = arguments[0];
    brandName = arguments[1];
    actualPrice = (arguments[2] as num).toInt(); // Cast to int
    sellPrice = (arguments[3] as num).toInt(); // Cast to int
  }

  Future<void> saveFormToFirestore() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        FormBuyProductModel product = FormBuyProductModel(
            productName: productName,
            brandName: brandName,
            phoneNumber: phoneNumberController.text,
            street: streetController.text,
            city: cityController.text,
            state: stateController.text,
            postalCode: postalCodeController.text,
            country: countryController.text,
            userName: nameCurrent,
            actualPrice: actualPrice,
            sellPrice: sellPrice);

        await FirebaseFirestore.instance
            .collection('Buyer')
            .add(product.toJson());
        TLoader.successSnackBar(
            title: 'Success',
            message: 'Product information saved successfully');
        phoneNumberController.clear();
        streetController.clear();
        cityController.clear();
        stateController.clear();
        postalCodeController.clear();
        countryController.clear();
      } catch (e) {
        TLoader.errorSnackBar(
            title: 'Error', message: 'Failed to save product information');
      }
    }
  }
}
