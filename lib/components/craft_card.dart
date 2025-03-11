import 'package:caribe/components/iconic_button.dart';
import 'package:caribe/components/price_tag.dart';
import 'package:caribe/components/rating_indicator.dart';
import 'package:caribe/components/units_indicator.dart';
import 'package:caribe/model/artisan_class.dart';
import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CraftCard extends StatelessWidget {
  final CraftClass craft;
  final void Function(String)? onItemAdded;
  final bool canAddToCart;

  CraftCard({
    Key? key,
    required this.craft,
    this.onItemAdded,
    this.canAddToCart = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArtisanClass artisan = craft.getArtisan();

    return Card(
      child: SizedBox(
        height: 450,
        child: Column(
          children: [
            Image.network(
              craft.imageUrl!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(artisan.profilePicture!),
                              radius: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              artisan.name,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        PriceTag(price: craft.price),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            craft.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            craft.quantity > 1
                                ? (craft.quantity != 1
                                    ? "${craft.quantity} disponibles"
                                    : "Uno solo disponible")
                                : "Sin unidades disponibles",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RatingIndicator(rating: craft.rating),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        UnitsIndicator(
                          value: craft.reviews.toDouble(),
                          unit: "reseña",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    IconicButton(
                      label: "Añadir al carrito",
                      icon: Icons.shopping_cart,
                      onPressed: () => onItemAdded?.call(this.craft.id),
                      isEnabled: canAddToCart && craft.quantity > 0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
