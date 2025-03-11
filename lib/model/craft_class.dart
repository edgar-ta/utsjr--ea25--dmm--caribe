// craft_class.dart
import 'dart:io';

import 'package:caribe/model/artisan_class.dart'; // Para manejar archivos locales de imágenes

class CraftClass {
  String id;
  String imageUrl;
  String artisanId;
  double price;
  String title;
  double rating;
  int reviews;

  CraftClass({
    required this.id,
    required this.imageUrl,
    required this.artisanId,
    required this.price,
    required this.title,
    required this.rating,
    required this.reviews,
  });

  ArtisanClass getArtisan() {
    return ArtisanClass.artisans
        .firstWhere((element) => element.id == artisanId);
  }

  static final List<CraftClass> crafts = [
    CraftClass(
      id: "craft1",
      imageUrl: 'assets/images/crafts/sombrero_charro.jpg',
      title: 'Sombrero de Charro',
      price: 500.0,
      artisanId: 'artisan1',
      rating: 4.5,
      reviews: 23,
    ),
    CraftClass(
      id: "craft2",
      imageUrl: 'assets/images/crafts/mascara_madera.jpg',
      title: 'Máscara de Madera',
      price: 150.0,
      artisanId: 'artisan2',
      rating: 4.2,
      reviews: 15,
    ),
    CraftClass(
      id: "craft3",
      imageUrl: 'assets/images/crafts/alebrije_colorido.jpg',
      title: 'Alebrije Colorido',
      price: 200.0,
      artisanId: 'artisan3',
      rating: 4.8,
      reviews: 42,
    ),
    CraftClass(
      id: "craft4",
      imageUrl: 'assets/images/crafts/rebozo.jpg',
      title: 'Rebozo',
      price: 350.0,
      artisanId: 'artisan1',
      rating: 4.7,
      reviews: 15,
    ),
    CraftClass(
      id: "craft5",
      imageUrl: 'assets/images/crafts/talavera.jpeg',
      title: 'Talavera',
      price: 800.0,
      artisanId: 'artisan2',
      rating: 5.0,
      reviews: 8,
    ),
  ];
}
