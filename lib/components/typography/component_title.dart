import 'package:flutter/material.dart';

class ComponentTitle extends StatelessWidget {
  String data;

  ComponentTitle({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
