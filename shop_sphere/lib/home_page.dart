import 'package:flutter/material.dart';
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
          // Fixed title at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Our Featured Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Scrollable product list
          Expanded(
            child: ListView(
              children: [
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p1/600/400",
                  name: "Modern accent chair",
                  price: 200,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p2/600/400",
                  name: "Minimalist Desk lamp",
                  price: 300,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p3/600/400",
                  name: "Scandinavian Sofa",
                  price: 850,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p4/600/400",
                  name: "Rustic Coffee Table",
                  price: 150,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p5/600/400",
                  name: "Industrial Bookshelf",
                  price: 400,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p6/600/400",
                  name: "Wall Art Canvas",
                  price: 120,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p7/600/400",
                  name: "Boho Throw Pillow Set",
                  price: 80,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p8/600/400",
                  name: "LED Mirror Frame",
                  price: 220,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p9/600/400",
                  name: "Vintage Table Clock",
                  price: 95,
                ),
                ProductCard(
                  imageUrl: "https://picsum.photos/seed/p10/600/400",
                  name: "Luxe Floor Rug",
                  price: 330,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
