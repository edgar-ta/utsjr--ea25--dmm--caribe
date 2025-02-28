import 'package:caribe/model/artisan_class.dart';
import 'package:flutter/material.dart';

class ArtisanPreview extends StatelessWidget {
  final ArtisanClass artisanClass;

  const ArtisanPreview({super.key, required this.artisanClass});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.network(artisanClass.profilePicture),
        )
      ],
    );
  }
}
