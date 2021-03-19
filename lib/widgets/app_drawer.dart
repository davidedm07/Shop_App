import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Options'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text('Shop'),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Your orders'),
            leading: Icon(Icons.credit_card),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.route);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Manage Products'),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
