import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          'Ver más',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
