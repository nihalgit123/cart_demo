import 'package:cart/model.dart';
import 'package:cart/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  // final List<Product> cart;
  // final Function(Product) onDelete;

  const CartPage({super.key,});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) =>
         ListView.builder(
          itemCount:value.providercart.length,
          itemBuilder: (context, index) {
            final product = value.providercart[index];
            return ListTile(
              leading: Image.asset(product.image),
              title: Text(product.name),
              subtitle: Text("Rs ${product.price}"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<CartProvider>().removecart(product);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

