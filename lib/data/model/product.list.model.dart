// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  final bool? success;
  final String? message;
  final int? totalProducts;
  final List<SingleProducts>? data;

  ProductListModel({
    this.success,
    this.message,
    this.totalProducts,
    this.data,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    success: json["success"],
    message: json["message"],
    totalProducts: json["totalProducts"],
    data: json["data"] == null ? [] : List<SingleProducts>.from(json["data"]!.map((x) => SingleProducts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalProducts": totalProducts,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleProducts {
  final int? id;
  final String? name;
  final String? productType;
  final String? unit;
  final String? shortDescription;
  final String? longDescription;
  final double? tax;
  final String? country;
  final int? isStock;
  final int? purchasePrice;
  final double? regularPrice;
  final double? sellingPrice;
  final double? wholePrice;
  final dynamic discountPrice;
  final String? categoryImage;
  final String? categoryName;
  final List<Image>? images;
  final List<dynamic>? variants;
  final List<int>? subcategories;
  final List<dynamic>? tags;

  SingleProducts({
    this.id,
    this.name,
    this.productType,
    this.unit,
    this.shortDescription,
    this.longDescription,
    this.tax,
    this.country,
    this.isStock,
    this.purchasePrice,
    this.regularPrice,
    this.sellingPrice,
    this.wholePrice,
    this.discountPrice,
    this.categoryImage,
    this.categoryName,
    this.images,
    this.variants,
    this.subcategories,
    this.tags,
  });

  factory SingleProducts.fromJson(Map<String, dynamic> json) => SingleProducts(
    id: json["id"],
    name: json["name"],
    productType: json["product_type"],
    unit: json["unit"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    tax: json["tax"]?.toDouble(),
    country: json["country"],
    isStock: json["is_stock"],
    purchasePrice: json["purchase_price"],
    regularPrice: json["regular_price"]?.toDouble(),
    sellingPrice: json["selling_price"]?.toDouble(),
    wholePrice: json["whole_price"]?.toDouble(),
    discountPrice: json["discount_price"],
    categoryImage: json["category_image"],
    categoryName: json["category_name"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
    subcategories: json["subcategories"] == null ? [] : List<int>.from(json["subcategories"]!.map((x) => x)),
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_type": productType,
    "unit": unit,
    "short_description": shortDescription,
    "long_description": longDescription,
    "tax": tax,
    "country": country,
    "is_stock": isStock,
    "purchase_price": purchasePrice,
    "regular_price": regularPrice,
    "selling_price": sellingPrice,
    "whole_price": wholePrice,
    "discount_price": discountPrice,
    "category_image": categoryImage,
    "category_name": categoryName,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
    "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x)),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
  };
}

class Image {
  final int? imageId;
  final String? imageUrl;

  Image({
    this.imageId,
    this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    imageId: json["image_id"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId,
    "image_url": imageUrl,
  };
}
