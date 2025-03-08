import 'package:flutter/material.dart';

class CraftClass {
  final String imageUrl;
  final String artisanName;
  final String profileImageUrl;
  final double price;
  final String title;
  final double rating;
  final int reviews;

  CraftClass({
    required this.imageUrl,
    required this.artisanName,
    required this.profileImageUrl,
    required this.price,
    required this.title,
    required this.rating,
    required this.reviews,
  });

  get imageFile => null;
}
