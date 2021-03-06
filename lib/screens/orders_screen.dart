import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';


import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {

  static const route ='/orders';

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            OrderItem(ordersProvider.orders[index]),
        itemCount: ordersProvider.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
