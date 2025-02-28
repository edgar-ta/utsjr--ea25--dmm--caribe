import 'package:caribe/components/typography/component_title.dart';
import 'package:caribe/components/typography/icon_component.dart';
import 'package:caribe/model/artisan_class.dart';
import 'package:flutter/material.dart';

class ArtisanCard extends StatelessWidget {
  ArtisanClass artisanClass;

  ArtisanCard({super.key, required this.artisanClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circle Avatar Placeholder
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(artisanClass.profilePicture),
          ),
          const SizedBox(height: 12),
          ComponentTitle(
            data: artisanClass.name,
          ),
          const SizedBox(height: 4),
          Text(
            artisanClass.description,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconComponent(data: Icons.location_on),
                  const SizedBox(width: 4),
                  Text(artisanClass.location),
                ],
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: IconComponent(data: Icons.email),
                onPressed: () {},
              ),
              IconButton(
                icon: IconComponent(data: Icons.phone),
                onPressed: () {},
              ),
            ],
          ),
          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: const Text("Ver Perfil",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
