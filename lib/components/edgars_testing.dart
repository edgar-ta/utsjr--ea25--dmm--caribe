import 'package:caribe/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:caribe/components/craft_card.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:caribe/pages/home_art_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
