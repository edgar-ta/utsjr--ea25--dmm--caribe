// home.dart
import 'package:caribe/components/artisan_card.dart';
import 'package:caribe/components/typography/section_title.dart';
import 'package:caribe/model/artisan_class.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Para controlar la pestaña seleccionada

  // Lista de pantallas
  final List<Widget> _screens = [
    const HomeScreen(), // Asegurar que HomeScreen tenga su propio SingleChildScrollView si es necesario
    SearchScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Expande la pantalla seleccionada sin causar overflow
              child: IndexedStack(
                index: _currentIndex,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambiar a la pantalla correspondiente
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
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

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Artesanos'),
            SizedBox(height: 10),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ArtisanCard(
                  artisanClass: ArtisanClass(
                    name: "Edgar Trejo Avila",
                    description: "Something",
                    location: "fs",
                    email: "edgar.avila.rro@gmail.com",
                    phone: "+524271861970",
                    profilePicture: "https://i",
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Categorías'),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Artesanías'),
            SizedBox(height: 10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.grey[300], // Dejar en blanco
                  );
                },
              ),
            ),
          ],
        ),
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
