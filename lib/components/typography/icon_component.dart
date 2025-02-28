import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  IconData data;

  IconComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Icon(
      data,
      size: 24,
    );
  }
}
