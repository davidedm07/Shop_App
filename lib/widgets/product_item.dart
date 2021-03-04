import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          ProductDetailScreen.route,
          arguments: product.id,
        ),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              color: Colors.red,
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.setFavorite();
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product);
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
