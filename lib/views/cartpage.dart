import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';
import '../model/product_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.red,
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Total"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Rs ${Provider.of<Cart>(context).total.toString()}",
                  textScaleFactor: 1.5),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Cart page")),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.basketItems.length,
            itemBuilder: (context, index) {
              final Product product = cart.basketItems[index];
              return Card(
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.remove(product);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
