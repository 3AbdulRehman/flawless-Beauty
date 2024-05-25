
import 'package:flawless_beauty/shop/models/bannner_model.dart';
import 'package:flawless_beauty/shop/models/brand_model.dart';
import 'package:flawless_beauty/shop/models/product_attribute_model.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/models/product_variation_model.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'category_model.dart';

class TDummyData{
  /// -- Banner
   static final List<BannerModel> banners = [
     BannerModel(imageurl: TImage.bannerImage1, targetScreen: Routes.order, active: true ),
     BannerModel(imageurl: TImage.bannerImage2, targetScreen: Routes.cart, active: true),
     BannerModel(imageurl: TImage.bannerImage3, targetScreen: Routes.favourites, active: true),
     BannerModel(imageurl: TImage.bannerImage1, targetScreen: Routes.search, active: true),
     BannerModel(imageurl: TImage.bannerImage2, targetScreen: Routes.settings, active: false),
     BannerModel(imageurl: TImage.bannerImage3, targetScreen: Routes.userAddress, active: true),
     BannerModel(imageurl: TImage.bannerImage1, targetScreen: Routes.checkout, active: false),
   ];
  /// -- User

  /// -- Cart

  /// -- Order

  /// -- List of all Products
  static final List<CategoryModel> categories   = [
    CategoryModel(id: '1', name: 'Hair Style', image: TImage.haircut, isFeatured: true),
    CategoryModel(id: '5', name: 'Face Treatment', image: TImage.facial, isFeatured: true),
    CategoryModel(id: '2', name: 'Makeup', image: TImage.facial, isFeatured: true),
    CategoryModel(id: '3', name: 'Cosmetic', image: TImage.comestic, isFeatured: true),


    //// SubCategory
    CategoryModel(id: '8', name: 'Natural Products', image: TImage.haircut, isFeatured: true),
    CategoryModel(id: '1', name: 'Hair Shampoo', image: TImage.haircut, isFeatured: true),
    CategoryModel(id: '1', name: 'Face Cleaner ', image: TImage.haircut, isFeatured: true),

    /// Furniture
    CategoryModel(id: '1', name: 'Furniture', image: TImage.haircut, isFeatured: true),
    CategoryModel(id: '1', name: 'Face Cleaner ', image: TImage.haircut, isFeatured: true),


    /// Electronic
    CategoryModel(id: '1', name: 'Electronic', image: TImage.haircut, isFeatured: true),
    CategoryModel(id: '1', name: 'Face Cleaner ', image: TImage.haircut, isFeatured: true),

  ];

   /// -- List of all Products
   static final List<ProductModel> products   = [
    ProductModel(
        id: '001',
        title: 'Salon ',
        stock: 15,
        price: 1500,
        isFeatured: true,
        thumbnail: TImage.bannerImage1,
        description: 'saloon Application',
        brand: BrandModel(id: '1', image: TImage.brand1, name: 'Lo`real',productsCount: 256,isFeatured: true),
        images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
          ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34']),
        ],
        productVariations: [
          /// Variation 1
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 534,
              salePrice: 520,
              image: TImage.productImage1,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 34'}),
          /// Variation 1
          ProductVariationModel(
              id: '2',
              stock: 9,
              price: 134,
              salePrice: 120,
              image: TImage.productImage3,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 32'}),
          /// Variation 3
          ProductVariationModel(
              id: '3',
              stock: 14,
              price: 634,
              salePrice: 580,
              image: TImage.productImage2,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 34'}),
          //
          /// Variation 4
          ProductVariationModel(
              id: '4',
              stock: 34,
              price: 534,
              salePrice: 520,
              image: TImage.productImage1,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 34'}),
          /// Variation 5
          ProductVariationModel(
              id: '5',
              stock: 9,
              price: 134,
              salePrice: 120,
              image: TImage.productImage3,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 32'}),
          /// Variation 6
          ProductVariationModel(
              id: '6',
              stock: 14,
              price: 634,
              salePrice: 580,
              image: TImage.productImage2,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 34'}),



        ],
        productType: 'ProductType.variable',
   ),
     ProductModel(
       id: '001',
       title: 'Salon ',
       stock: 15,
       price: 1500,
       isFeatured: true,
       thumbnail: TImage.bannerImage3,
       description: 'saloon Application',
       brand: BrandModel(id: '1', image: TImage.brand1, name: 'Lo`real',productsCount: 256,isFeatured: true),
       images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
       salePrice: 30,
       sku: 'ABR4568',
       categoryId: '1',
       productAttributes: [
         ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
         ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34']),
       ],
       productVariations: [
         /// Variation 1
         ProductVariationModel(
             id: '1',
             stock: 34,
             price: 534,
             salePrice: 520,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         /// Variation 1
         ProductVariationModel(
             id: '2',
             stock: 9,
             price: 134,
             salePrice: 120,
             image: TImage.productImage1,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 32'}),
         /// Variation 3
         ProductVariationModel(
             id: '3',
             stock: 14,
             price: 634,
             salePrice: 580,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         //
         /// Variation 4
         ProductVariationModel(
             id: '4',
             stock: 34,
             price: 534,
             salePrice: 520,
             image: TImage.productImage1,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         /// Variation 5
         ProductVariationModel(
             id: '5',
             stock: 9,
             price: 134,
             salePrice: 120,
             image: TImage.productImage3,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 32'}),
         /// Variation 6
         ProductVariationModel(
             id: '6',
             stock: 14,
             price: 634,
             salePrice: 580,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),



       ],
       productType: 'ProductType.variable',
     ),
     ProductModel(
       id: '001',
       title: 'Salon ',
       stock: 15,
       price: 1500,
       isFeatured: true,
       thumbnail: TImage.bannerImage3,
       description: 'saloon Application',
       brand: BrandModel(id: '1', image: TImage.brand1, name: 'Lo`real',productsCount: 256,isFeatured: true),
       images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
       salePrice: 30,
       sku: 'ABR4568',
       categoryId: '1',
       productAttributes: [
         ProductAttributeModel(name: 'Color',values: ['Green','Black','Red']),
         ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34']),
       ],
       productVariations: [
         /// Variation 1
         ProductVariationModel(
             id: '1',
             stock: 34,
             price: 534,
             salePrice: 520,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         /// Variation 1
         ProductVariationModel(
             id: '2',
             stock: 9,
             price: 134,
             salePrice: 120,
             image: TImage.productImage1,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 32'}),
         /// Variation 3
         ProductVariationModel(
             id: '3',
             stock: 14,
             price: 634,
             salePrice: 580,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         //
         /// Variation 4
         ProductVariationModel(
             id: '4',
             stock: 34,
             price: 534,
             salePrice: 520,
             image: TImage.productImage1,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),
         /// Variation 5
         ProductVariationModel(
             id: '5',
             stock: 9,
             price: 134,
             salePrice: 120,
             image: TImage.productImage3,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 32'}),
         /// Variation 6
         ProductVariationModel(
             id: '6',
             stock: 14,
             price: 634,
             salePrice: 580,
             image: TImage.productImage2,
             description: 'This is a Product description for Green Lo`real',
             attributeValues: {'Color':'Green','Size':'EU 34'}),



       ],
       productType: 'ProductType.variable',
     ),
   ];


}