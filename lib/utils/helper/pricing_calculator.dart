/*
class TPricingCalculator{

   // Calculate Price based on tax and shipping

  static double calculatorTotalPrice(double productPrice ,String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount * shippingCost;

    return totalPrice;
  }

  //// Calculate Shipping Cost

static String calculatorShippingCost(double productPrice, String location ){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
}
//// Calculate Tax
static String calculateTax(double productPrice, String location ){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
}


static double getTaxRateForLocation(String location){
    // location the tac rate for the given location  from a tax rate database or api
  // return the appropriate tax rate
  return 0.10; /// Example shipping cost in RS
}



// ///
// Sun all cart values and return total amount
// // static double calculateCartTotal (CartModel cart) {
// return cart.items.map((e) => e.price).fold (0, (previousPrice, currentPrice) => previousPrice (currentPrice ?? 0));





}
*/
