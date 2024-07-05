

import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flawless_beauty/shop/controller/product/image_controller.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  /// Variable
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Selected Attributes , and Variation
 void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
   // When attribute is selected we will first add that attribute to the selectedAttributes
   final selectedAttributes = Map<String , dynamic>.from(this.selectedAttributes);
   selectedAttributes[attributeName] = attributeValue;
   this.selectedAttributes[attributeName] = attributeValue;

   final selectedVariation = product.productVariations!.firstWhere(
       (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
     orElse: () => ProductVariationModel.empty(),
   );

   // show the selected Variation image as a Main Image
   if(selectedVariation.image.isNotEmpty){
     ImagesController.instance.selectedProductImage.value = selectedVariation.image;
   }

   if(selectedVariation.id.isNotEmpty){
     final cartController = CartController.instance;
     cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
   }
   // Assign Selected Variation
   this.selectedVariation.value = selectedVariation;

   // update selected product variation status
   getProductVariationStockStatus();
 }

 /// Check if selected attributes match any variation attributes
  bool _isSameAttributeValues(Map<String ,dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
   // if selectedAttribute contain 3 attribute and current variation contain 2 then return.
    if(variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different the  return e.g [Green , Large] x [Green , Small]
    for(final key in variationAttributes.keys){
      // Attributes[key] = value which could be [Green , Small, Cotton] etc
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// Check Attribute Availability / Stock in variation
  List<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations,String attributeName){
   // Pass the Variation to check which attributes are available  and stock is not 0
    final availableVariationAttributesValues = variations.where(
            (variation)=>
                // check Empty / out of the Stock Attributes
               variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
    // Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName]).toList();

    return availableVariationAttributesValues;

  }

  String getVariationPrice(){
   return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// Check product variation stock status
  void getProductVariationStockStatus(){
   variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset Selected Attributes when switching products
  void resetSelectedAttributes(){
   selectedAttributes.clear();
   variationStockStatus.value = '';
   selectedVariation.value = ProductVariationModel.empty();
  }
}