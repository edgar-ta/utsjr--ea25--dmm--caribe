import 'package:flutter/material.dart';
import 'package:caribe/model/craft_class.dart';

class CraftCard extends StatelessWidget {
  final CraftClass craft;

  const CraftCard({Key? key, required this.craft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen más pequeña
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              craft.imageUrl,
              height: 120, // Altura reducida de la imagen
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título más pequeño
                Text(
                  craft.title,
                  style: const TextStyle(
                    fontSize: 14, // Tamaño de fuente reducido
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Precio más pequeño
                Text(
                  '\$${craft.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12, // Tamaño de fuente reducido
                    color: Colors.grey,
                  ),
                ),
                // Nombre del artesano más pequeño
                Text(
                  craft.artisanName,
                  style: const TextStyle(
                    fontSize: 12, // Tamaño de fuente reducido
                    color: Colors.grey,
                  ),
                ),
                // Rating y reseñas más pequeños
                Row(
                  children: [
                    Icon(Icons.star,
                        color: Colors.amber, size: 14), // Icono más pequeño
                    const SizedBox(width: 4),
                    Text(
                      '${craft.rating} (${craft.reviews} reseñas)',
                      style: const TextStyle(
                        fontSize: 12, // Tamaño de fuente reducido
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
