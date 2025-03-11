import 'package:caribe/components/artisan_card.dart';
import 'package:caribe/components/craft_card.dart';
import 'package:caribe/pages/user_pages/user_home_screen/category_grid.dart';
import 'package:caribe/components/typography/section_title.dart';
import 'package:caribe/model/artisan_class.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final List<Map<String, String>> _artesanias = [
    {
      'image': 'assets/images/crafts/sombrero_charro.jpg',
      'description': 'Sombrero de Charro, símbolo de la charrería mexicana.'
    },
    {
      'image': 'assets/images/crafts/mascara_madera.jpg',
      'description': 'Máscaras de madera, utilizadas en danzas y festivales.'
    },
    {
      'image': 'assets/images/crafts/alebrije_colorido.jpg',
      'description':
          'Alebrijes, figuras de colores vibrantes originarias de Oaxaca.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Destacados"),
          CarouselSlider(
            items: _artesanias.map((artesania) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            artesania['image']!,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: Colors.black.withOpacity(0.6),
                            child: Text(
                              artesania['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 350,
              enlargeCenterPage: true,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
          ),
          SizedBox(height: 48),
          SectionTitle(title: "Categorías"),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: CategoryGrid(),
          ),
          SizedBox(height: 48),
          SectionTitle(title: "Artesanías"),
          CarouselSlider(
            items: List.generate(
              CraftClass.crafts.length,
              (index) => CraftCard(
                craft: CraftClass.crafts[index],
              ),
            ),
            options: CarouselOptions(
              height: 450,
              aspectRatio: 9 / 16,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 48),
          SectionTitle(title: "Artesanos"),
          CarouselSlider(
            items: List.generate(
              ArtisanClass.artisans.length,
              (index) => ArtisanCard(
                artisanClass: ArtisanClass.artisans[index],
              ),
            ),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 9 / 16,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
