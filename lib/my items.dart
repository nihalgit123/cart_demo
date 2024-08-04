import 'package:flutter/material.dart';
import 'package:cart/product.dart'; // Import your ProductPage here

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List<String> items = [
    "Umbrella", "Saree", "Shirt", "Pant", "Socks", "Cap", "Trouser", "Leggings",
    "Underwear", "Trunk", "Towel", "Bedsheet", "Jersey", "T shirt", "Raincoat",
    "Babywear", "Panties", "Braziers", "Lining", "Blouse piece", "Thorth",
    "Dhothi", "Cheerp", "Mug", "3 4th", "Banyan", "Maxi", "Namaz dress",
    "Shall", "Thoppi", "Palasa"
  ];

  void goToProductPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Our Items")),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () => goToProductPage(),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Adjust padding as needed
              ),
              child: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}

