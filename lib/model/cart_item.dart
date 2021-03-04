import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}
