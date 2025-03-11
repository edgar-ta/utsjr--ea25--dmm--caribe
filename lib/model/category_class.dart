import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryClass {
  final IconData icon;
  final String label;
  final Color color;

  CategoryClass({required this.icon, required this.label, required this.color});

  static final List<CategoryClass> categories = [
    CategoryClass(
        icon: FontAwesomeIcons.shirt,
        label: "Textiles",
        color: AppColors.azulCieloTropical),
    CategoryClass(
        icon: FontAwesomeIcons.cube,
        label: "Cerámica",
        color: AppColors.naranjaAtardecer),
    CategoryClass(
        icon: FontAwesomeIcons.ring,
        label: "Joyería",
        color: AppColors.grisSuave),
    CategoryClass(
        icon: FontAwesomeIcons.utensils,
        label: "Cestería",
        color: AppColors.azulCieloTropical),
    CategoryClass(
        icon: FontAwesomeIcons.pallet,
        label: "Madera Tallada",
        color: AppColors.naranjaAtardecer),
    CategoryClass(
      icon: FontAwesomeIcons.book,
      label: "Cuero y Marroquinería",
      color: AppColors.grisSuave,
    ),
  ];
}
