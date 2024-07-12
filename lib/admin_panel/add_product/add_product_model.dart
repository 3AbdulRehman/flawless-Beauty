class AddProductModel {
  final String? id; // Made nullable to handle documents without an id initially
  final String productName;
  final String brandName;
  final double actualPrice;
  final double sellPrice;
  final String imageUrl;

  AddProductModel({
    this.id,
    required this.productName,
    required this.brandName,
    required this.actualPrice,
    required this.sellPrice,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "brandName": brandName,
      "actualPrice": actualPrice,
      "sellPrice": sellPrice,
      "imageUrl": imageUrl,
    };
  }

  factory AddProductModel.fromJson(Map<String, dynamic> json, String id) {
    return AddProductModel(
      id: id,
      productName: json["productName"],
      brandName: json["brandName"],
      actualPrice: json["actualPrice"],
      sellPrice: json["sellPrice"],
      imageUrl: json["imageUrl"],
    );
  }
}
