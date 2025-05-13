import 'dart:convert';

class CartDataModel {
  final int? id;
  final int? userId;
  final String? date;
  final List<Product>? products;
  final int? v;

  CartDataModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products?.map((x) => x.toMap()).toList(),
      'v': v,
    };
  }

  factory CartDataModel.fromMap(Map<String, dynamic> map) {
    return CartDataModel(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      date: map['date'],
      products: map['products'] != null
          ? List<Product>.from(map['products']?.map((x) => Product.fromMap(x)))
          : null,
      v: map['v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDataModel.fromJson(String source) =>
      CartDataModel.fromMap(json.decode(source));
}

class Product {
  final int? productId;
  final int? quantity;

  Product({this.productId, this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId']?.toInt(),
      quantity: map['quantity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
