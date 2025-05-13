import 'dart:async';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/storage_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartProvider extends ChangeNotifier {
  List<ProductDataModel>? _cartList = [];

  List<ProductDataModel>? get cartList => _cartList;

  double _totalPrice = 0.00;

  double get totalPrice => _totalPrice;

  int _cartItem = 1;
  int get cartItem => _cartItem;

  late int _uId;
  int get uId => _uId;

  // double _cartItemPrice = 0;
  // double get cartItemPrice => _cartItemPrice;

  final List<ProductDataModel> _favouriteItemList = [];
  List<ProductDataModel>? get favouriteItemList => _favouriteItemList;

  Future getUserId() async {
    final id = await StorageProvider.i.getStorageValue("id");

    _uId = int.parse(id);
    notifyListeners();
  }

  Future<void> addToCart(ProductDataModel data) async {
    if (_cartItem > 0) {
      _cartList!.add(data);

      _totalPrice += data.price!;
      Fluttertoast.showToast(msg: "Product added to Cart");
    } else {
      Fluttertoast.showToast(msg: "Add atlest 1 product");
    }
    notifyListeners();
  }

  Future<void> removeFromCart(ProductDataModel data) async {
    _cartList!.remove(data);

    if (_totalPrice > 0) {
      _totalPrice -= data.price!;
    }

    notifyListeners();
  }

  Future<void> addToFavourite(ProductDataModel data) async {
    _favouriteItemList.add(data);
    notifyListeners();
  }

  Future<void> removeFromFavourite(ProductDataModel data) async {
    _favouriteItemList.remove(data);
    notifyListeners();
  }

  increaseCartItem() {
    _cartItem = _cartItem + 1;
    notifyListeners();
  }

  decreaseCartItem() {
    if (_cartItem > 0) {
      _cartItem--;
      notifyListeners();
    }

    notifyListeners();
  }
}

















// Future<void> getUserCart() async {
  //   //int id
  //   // Timer(Duration(seconds: 2), () {
  //   getUserId();
  //   // });
  //   notifyListeners();
  //   final response = await apiService.get("carts/user/$uId");

  //   if (response != null) {
  //     if (response.statusCode == 200) {
  //       final data = response.data as List<dynamic>;

  //       _cartList = data.map((e) {
  //         return CartDataModel(
  //             id: e["id"],
  //             date: e["date"],
  //             userId: e["userId"],
  //             products: e["products"],
  //             v: e["v"]);
  //       }).toList();

  //       // _cartList =
  //       //     List.from(response.data.map((e) => CartDataModel.fromJson(e)));

  //       notifyListeners();
  //       print(_cartList!.first.products);
  //     }
  //   }
  // }




