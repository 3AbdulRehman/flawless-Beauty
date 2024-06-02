
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
     BannerModel(imageUrl: TImage.bannerImage1, targetScreen: Routes.order, active: true ),
     BannerModel(imageUrl: TImage.bannerImage2, targetScreen: Routes.cart, active: true),
     BannerModel(imageUrl: TImage.bannerImage3, targetScreen: Routes.favourites, active: true),
     BannerModel(imageUrl: TImage.bannerImage1, targetScreen: Routes.search, active: true),
     BannerModel(imageUrl: TImage.bannerImage2, targetScreen: Routes.settings, active: false),
     BannerModel(imageUrl: TImage.bannerImage3, targetScreen: Routes.userAddress, active: true),
     BannerModel(imageUrl: TImage.bannerImage1, targetScreen: Routes.checkout, active: false),
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
             // salePrice: 120,
              image: TImage.productImage3,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Black','Size':'EU 32'}),
          /// Variation 3
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
             // salePrice: 580,
              image: TImage.productImage2,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Black','Size':'EU 34'}),
          //
          /// Variation 4
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 534,
             // salePrice: 520,
              image: TImage.productImage1,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Green','Size':'EU 32'}),
          /// Variation 5
          ProductVariationModel(
              id: '5',
              stock: 9,
              price: 134,
             // salePrice: 120,
              image: TImage.productImage3,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Red','Size':'EU 34'}),
          /// Variation 6
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 323,
              //salePrice: 580,
              image: TImage.productImage2,
              description: 'This is a Product description for Green Lo`real',
              attributeValues: {'Color':'Red','Size':'EU 32'}),
        ],
        productType: 'ProductType.variable',
   ),
     ProductModel(
       id: '002',
       title: 'Blue Shirt ',
       stock: 15,
       price: 1500,
       isFeatured: true,
       thumbnail: TImage.bannerImage3,
       description: 'saloon Application',
       brand: BrandModel(id: '6', image: TImage.brand1, name: 'Lo`real',/*productsCount: 256,isFeatured: true*/),
       images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
       salePrice: 30,
       sku: 'ABR4568',
       categoryId: '16',
       productAttributes: [
         ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
         ProductAttributeModel(name: 'Color',values: ['Green','Red','Blue']),
       ],
   productType: 'ProductType.single'
   ),
     ProductModel(
         id: '003',
         title: 'Blue Shirt ',
         stock: 15,
         price: 1500,
         isFeatured: true,
         thumbnail: TImage.bannerImage3,
         description: 'saloon Application',
         brand: BrandModel(id: '6', image: TImage.brand1, name: 'Lo`real',/*productsCount: 256,isFeatured: true*/),
         images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
         salePrice: 30,
         sku: 'ABR4568',
         categoryId: '16',
         productAttributes: [
           ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
           ProductAttributeModel(name: 'Color',values: ['Green','Red','Blue']),
         ],
         productType: 'ProductType.single'
     ),
     ProductModel(
         id: '004',
         title: '4 Color t-shirt dry fit',
         stock: 15,
         price: 1500,
         isFeatured: true,
         thumbnail: TImage.bannerImage3,
         description: 'saloon Application',
         brand: BrandModel(id: '6', image: TImage.brand1, name: 'Lo`real',/*productsCount: 256,isFeatured: true*/),
         images: [TImage.bannerImage2,TImage.bannerImage1,TImage.bannerImage3,TImage.bannerImage2],
         salePrice: 30,
         sku: 'ABR4568',
         categoryId: '16',
         productAttributes: [
           ProductAttributeModel(name: 'Color',values: ['Red','Yellow','Green',"Blue"]),
           ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34']),
         ],
         productVariations: [
           ProductVariationModel(
               id: '1',
               stock:  34,
               price: 134,
               salePrice: 122.6,
               image: TImage.bannerImage2,
               description: 'this is The product of 4',
               attributeValues: {'Color' : 'Red','Size':'EU 34'}),
           ProductVariationModel(id: '2',stock: 15,price: 132,image: TImage.brand1, attributeValues: {'Color': 'Red','Size':'EU 32'}),
           ProductVariationModel(id: '4',stock: 222,price: 232,image: TImage.bannerImage2, attributeValues: {'Color': 'Yellow','Size':'EU 32'}),
           ProductVariationModel(id: '5',stock: 0,price: 235,image: TImage.bannerImage1, attributeValues: {'Color': 'Green','Size':'EU 34'}),
           ProductVariationModel(id: '6',stock:11,price: 232,image: TImage.bannerImage3, attributeValues: {'Color': 'Green','Size':'EU 30'}),
           ProductVariationModel(id: '7',stock: 0,price: 234,image: TImage.bannerImage1, attributeValues: {'Color': 'Blue','Size':'EU 30'}),
           ProductVariationModel(id: '8',stock: 11,price: 234,image: TImage.bannerImage2, attributeValues: {'Color': 'Blue','Size':'EU 34'}),

         ],
         productType: 'ProductType.variable'
     ),


///////////// Product offer banner
   ProductModel(
       id: '005',
       title: 'Nike air',
       stock: 15,
       price: 35,
       isFeatured: false,
       thumbnail: TImage.bannerImage1,
       description: 'Nike Product',
       brand: BrandModel(id: '1',image: TImage.makeup,name: "nike",productsCount: 256,isFeatured: true),
       images: [TImage.bannerImage1,TImage.bannerImage2,TImage.bannerImage3],
       salePrice: 30,
       sku: 'ABR4568',
       categoryId: '8',
       productAttributes: [
         ProductAttributeModel(name: 'Color',values: ['Orange','Black','Brown']),
         ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34']),
       ],
       productVariations: [
         ProductVariationModel(
             id: '1',
             stock: 16,
             price: 36,
             salePrice: 12.6,
             image: TImage.bannerImage2,
             description: 'Flutter is Google ',
             attributeValues: {'Color':'Orange','Size':'EU 34'}),
         ProductVariationModel(
             id: '2', stock: 15, price: 35,  image: TImage.bannerImage3, attributeValues: {'Color':'Black','Size':'EU 32'}),
         ProductVariationModel(
             id: '3', stock: 14, price: 34,  image: TImage.makeup, attributeValues: {'Color':'Brown','Size':'EU 34'}),
         ProductVariationModel(
             id: '4', stock: 13, price: 33,  image: TImage.bannerImage3, attributeValues: {'Color':'Black','Size':'EU 34'}),
         ProductVariationModel(
             id: '5', stock: 12, price: 32,  image: TImage.bannerImage2, attributeValues: {'Color':'Black','Size':'EU 32'}),
         ProductVariationModel(
             id: '6', stock: 11, price: 31,  image: TImage.makeup, attributeValues: {'Color':'Orange','Size':'EU 32'}),
                ],

       productType: 'productType.variable'), /// 21 :38

     // 6
     ProductModel(
         id: '006',
         title: 'Samsung  Galaxy s9',
         stock: 15,
         price: 755,
         isFeatured: false,
         thumbnail: TImage.bannerImage2,
         description: 'Samsung Galaxy S9 Product',
         brand: BrandModel(id: '7',image: TImage.makeup,name: "Samsung",),
         images: [TImage.bannerImage1,TImage.bannerImage2,TImage.bannerImage3],
         salePrice: 360,
         sku: 'ABR4568',
         categoryId: '2',
         productAttributes: [
           ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
           ProductAttributeModel(name: 'Color',values: ['Green','Red','Black']),
         ],
         productType: 'productType.single'),
     ProductModel(
         id: '007',
         title: 'TOMI  Dog',
         stock: 15,
         price: 20,
         isFeatured: false,
         thumbnail: TImage.bannerImage1,
         description: 'tomi Product',
         brand: BrandModel(id: '7',image: TImage.brand1,name: "Tomi",),
         images: [TImage.bannerImage1,TImage.bannerImage2,TImage.bannerImage3],
         salePrice: 10,
         sku: 'ABR4568',
         categoryId: '4',
         productAttributes: [
           ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
           ProductAttributeModel(name: 'Color',values: ['Green','Red','Black']),
         ],
         productType: 'productType.single'),
     ProductModel(
         id: '009',
         title: 'nike air ',
         stock: 15,
         price: 400,
         isFeatured: false,
         thumbnail: TImage.bannerImage2,
         description: 'nike Product',
         brand: BrandModel(id: '1',image: TImage.brand1,name: "Nike",),
         images: [TImage.bannerImage1,TImage.bannerImage2,TImage.bannerImage3],
         salePrice: 200,
         sku: 'ABR4568',
         categoryId: '8',
         productAttributes: [
           ProductAttributeModel(name: 'Size',values: ['EU34','EU32']),
           ProductAttributeModel(name: 'Color',values: ['Green','Red','Black']),
         ],
         productType: 'productType.single'),


   ];





}