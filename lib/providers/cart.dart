import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/model/cart_item.dart';
import 'package:flutter_complete_guide/providers/product.dart';

import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItemByProductId = {};

  Map<String, CartItem> get items {
    return {..._cartItemByProductId};
  }

  void addItem(Product product) {
    _cartItemByProductId.putIfAbsent(
        product.id,
        () => CartItem(
            id: Uuid().toString(),
            title: product.title,
            quantity: 0,
            price: product.price));

    _cartItemByProductId[product.id].quantity =
        _cartItemByProductId[product.id].quantity + 1;

    notifyListeners();
  }

  int get itemsCount {
    return _cartItemByProductId.isEmpty
        ? 0
        : _cartItemByProductId.values
            .map((cartItem) => cartItem.quantity)
            .reduce((a, b) => a + b);
  }
}
