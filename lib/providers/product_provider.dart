import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductDataModel>? _productList;

  List<ProductDataModel>? get productList => _productList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductDataModel>? _allproducts;

  List<ProductDataModel>? get allproducts => _allproducts;

  final List<ProductDataModel> _searchList = [];

  List<ProductDataModel> get searchList => _searchList;

  String _searchText = "";

  String get searchText => _searchText;

  Future<void> getProductList(String path) async {
    final response = await apiService.get("products/$path"); //"products"

    _isLoading = true;
    if (response != null) {
      if (response.statusCode == 200) {
        _isLoading = false;
        _productList =
            List.from(response.data.map((e) => ProductDataModel.fromJson(e)));

        notifyListeners();
      }
    }
  }

  Future<void> getAllProducts() async {
    final response = await apiService.get("products");

    if (response != null) {
      if (response.statusCode == 200) {
        _allproducts =
            List.from(response.data.map((e) => ProductDataModel.fromJson(e)));

        notifyListeners();
      }
    }
  }

  updateData() {
    _searchList.clear();
    if (_searchText.isEmpty) {
      _searchList.add(_allproducts as ProductDataModel);
    } else {
      _searchList.addAll(_allproducts!
          .where(
              (element) => element.title!.toLowerCase().startsWith(_searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String productTitle) {
    _searchText = productTitle;
    updateData();
    notifyListeners();
  }
}
