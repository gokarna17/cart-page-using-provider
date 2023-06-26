import 'package:flutter/material.dart';

import 'product_model.dart';

class Cart extends ChangeNotifier {
  List<Product> _product = [];
  double? _total;

  void add(Product product) {
    _product.add(product);
    _total = (_total ?? 0) + product.price;
    notifyListeners();
  }

  void remove(Product product) {
    _product.remove(product);
    _total = (_total ?? 0) - product.price;
    notifyListeners();
  }

  int get count {
    return _product.length;
  }

  double? get total {
    return _total;
  }

  List<Product> get basketItems {
    return _product;
  }
}
