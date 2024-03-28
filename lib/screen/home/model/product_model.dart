// To parse this JSON data, do
//
//     final productModelOne = productModelOneFromJson(jsonString);

import 'dart:convert';

ProductModel productModelOneFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelOneToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    String type;
    String title;
    List<product> contents;
    String id;

    ProductModel({
        required this.type,
        required this.title,
        required this.contents,
        required this.id,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        type: json["type"],
        title: json["title"],
        contents: List<product>.from(json["contents"].map((x) => product.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "id": id,
    };
}

class product {
    String sku;
    String productName;
    String productImage;
    int productRating;
    String actualPrice;
    String offerPrice;
    String discount;

    product({
        required this.sku,
        required this.productName,
        required this.productImage,
        required this.productRating,
        required this.actualPrice,
        required this.offerPrice,
        required this.discount,
    });

    factory product.fromJson(Map<String, dynamic> json) => product(
        sku: json["sku"] ?? "",
              productName: json["product_name"] ?? "",
              productImage: json["product_image"] ?? "",
              productRating: json["product_rating"] ?? 0,
              actualPrice: json["actual_price"] ?? "",
              offerPrice: json["offer_price"] ?? "",
              discount: json["discount"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
    };
}
