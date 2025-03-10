// craft_class.dart
import 'dart:io'; // Para manejar archivos locales de imágenes

class CraftClass {
  String imageUrl;
  String artisanName;
  String profileImageUrl;
  double price;
  String title;
  double rating;
  int reviews;
  File? imageFile; // Propiedad opcional para la imagen del producto

  CraftClass({
    required this.imageUrl,
    required this.artisanName,
    required this.profileImageUrl,
    required this.price,
    required this.title,
    required this.rating,
    required this.reviews,
    this.imageFile,
  });
}
