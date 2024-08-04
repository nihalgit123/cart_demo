
import 'package:cart/model.dart';
import 'package:cart/cart.dart';
import 'package:cart/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // List<Product> cart = [];

  // void add(Product product) {
  //   setState(() {
  //     cart.add(product);
  //   });
  // }

  // void remove(Product product) {
  //   setState(() {
  //     cart.remove(product);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children:[ IconButton(
              icon: Icon(Icons.arrow_circle_right_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
             CircleAvatar(
              backgroundColor: Colors.red,
              radius: 12,
              child: Consumer<CartProvider>(
                builder: (context, value, child) => 
                 Text(value.providercart.length.toString())),
            )
        ]),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(product.image, height: 80, fit: BoxFit.cover),
                SizedBox(height: 8),
                Text(product.name, style: TextStyle(fontSize: 16)),
                Text("Rs ${product.price}", style: TextStyle(color: Colors.grey)),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().addcart(product);
                    // add(product);
                  },
                  child: Text("Add to cart"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
