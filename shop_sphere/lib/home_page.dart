import 'package:flutter/material.dart';
import 'package:shop_sphere/data/mock_data.dart';
import 'package:shop_sphere/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [Icon(Icons.person), Icon(Icons.add_outlined)],
        leading: Icon(Icons.menu),
        title: Text("ShopSphere"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Featured Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mockData.length,
              itemBuilder: (context, int index) {
                final product = mockData[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
