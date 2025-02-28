// home.dart
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Para controlar la pestaña seleccionada

  // Lista de pantallas (ahora con el carrito)
  final List<Widget> _screens = [
    const HomeScreen(), // Pantalla de inicio
    const SearchScreen(), // Pantalla de búsqueda
    const ProfileScreen(), // Pantalla de perfil
    const CartScreen(), // Pantalla de carrito
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _screens[
          _currentIndex], // Cambiar la pantalla según la pestaña seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambiar a la pantalla correspondiente
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
        ],
      ),
    );
  }
}

// Pantalla de inicio (Ejemplo)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bienvenido al Home',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Pantalla de búsqueda (Ejemplo)
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pantalla de Búsqueda',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Pantalla de perfil (Ejemplo)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pantalla de Perfil',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Pantalla de carrito (Ejemplo)
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pantalla de Carrito',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
