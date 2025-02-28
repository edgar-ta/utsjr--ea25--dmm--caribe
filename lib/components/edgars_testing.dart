import 'package:flutter/material.dart';
import 'package:caribe/components/craft_card.dart';
import 'package:caribe/model/craft_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Craft Store"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: CraftCard(
            craft: CraftClass(
              imageUrl:
                  "https://example.com/product.jpg", // URL de la imagen del producto
              artisanName: "Juan Pérez López",
              profileImageUrl:
                  "https://example.com/profile.jpg", // Imagen del artesano
              price: 100.0,
              title: "Lorem ipsum dolor sit amet",
              rating: 4.5,
              reviews: 18,
            ),
          ),
        ),
      ),
    );
  }
}
