import 'package:cart/model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Product> cart;
  final Function(Product) onDelete;

  const CartPage({super.key, required this.cart, required this.onDelete});

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
      body: ListView.builder(
        itemCount: widget.cart.length,
        itemBuilder: (context, index) {
          final product = widget.cart[index];
          return ListTile(
            leading: Image.asset(product.image),
            title: Text(product.name),
            subtitle: Text("Rs ${product.price}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.onDelete(product);
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}

