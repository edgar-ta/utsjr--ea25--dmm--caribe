import 'package:caribe/components/iconic_button.dart';
import 'package:caribe/components/typography/component_title.dart';
import 'package:caribe/components/typography/icon_component.dart';
import 'package:caribe/model/artisan_class.dart';
import 'package:flutter/material.dart';

class ArtisanCard extends StatelessWidget {
  ArtisanClass artisanClass;

  ArtisanCard({super.key, required this.artisanClass});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              Expanded(
                child: Row(
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
              ),
              IconicButton(
                label: "Ver perfil",
                icon: Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
