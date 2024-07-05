import 'package:flawless_beauty/shop/controller/product/variation_controller.dart';
import 'package:flawless_beauty/shop/models/cart_item_model.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/local_storage/storage_utility.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItem = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      TLoader.customToast(message: 'Selected Quantity ');
      return;
    }
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoader.customToast(message: 'Selected Variation ');
      return;
    }
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoader.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected Variation is out of stock');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoader.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected Product is out of stock');
        return;
      }
    }
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == selectedCartItem.productId &&
        cartItems.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoader.customToast(message: 'Your Product has been added to the Cart');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  // remove
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      }
    } else {
      cartItems[index].quantity == 1
          ? removeFromCartDialog(index)
          : cartItems.removeAt(index);
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        TLoader.customToast(
            message: 'Your Product has been removed from the Cart');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
  // Initialize already added Item`s Count in the Cart
  void updateAlreadyAddedProductCount(ProductModel product){

    if(product.productType == ProductType.single.toString()){

      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id,variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }

// This Function convert a productModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfCartItem = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfCartItem += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItem.value = calculatedNoOfCartItem;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemsString =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem =
    cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
