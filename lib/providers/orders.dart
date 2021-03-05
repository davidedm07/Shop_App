import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/model/cart_item.dart';
import 'package:flutter_complete_guide/model/order_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> items, double total) {
    var dateTime = DateTime.now();
    _orders.insert(
      0,
      OrderItem(
        id: dateTime.toString(),
        amount: total,
        products: items,
        dateTime: dateTime,
      ),
    );
    notifyListeners();
  }
}
