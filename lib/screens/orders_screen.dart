import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  final orders = Provider.of<Orders>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: Container(),
    );
  }
}
