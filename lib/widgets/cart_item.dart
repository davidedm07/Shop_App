import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$ ${this.price}'),
              ),
            ),
          ),
          title: Text('${this.title}'),
          subtitle: Text('Total: \$ ${this.price * this.quantity}'),
        ),
      ),
    );
  }
}
