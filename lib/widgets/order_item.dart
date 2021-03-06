import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/order_item.dart' as model;

class OrderItem extends StatefulWidget {
  final model.OrderItem _orderItem;

  OrderItem(this._orderItem);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget._orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy').format(widget._orderItem.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget._orderItem.products.length * 20.0 + 50, 180),
              child: ListView.builder(
                itemBuilder: (context, i) {
                  final product = widget._orderItem.products[i];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${product.quantity}x \$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: widget._orderItem.products.length,
              ),
            )
        ],
      ),
    );
  }
}
