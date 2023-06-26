import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../model/cart_model.dart';
import '../views/cartpage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Product> products = [
    Product(
      title: "mango",
      price: 50,
    ),
    Product(title: "apple", price: 40),
    Product(title: "banana", price: 35),
    Product(title: "grapes", price: 40),
    Product(title: "papaya", price: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Text(
                    cart.basketItems.length.toString(),
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              subtitle: Text(products[index].price.toString()),
              trailing: IconButton(
                onPressed: () => cart.add(products[index]),
                icon: Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
