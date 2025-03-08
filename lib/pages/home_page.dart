import 'package:flutter/material.dart';

class AppColors {
  static const Color azulCieloTropical = Color(0xFF87CEEB);
  static const Color naranjaAtardecer = Color(0xFFFF8C00);
  static const Color arenaCalida = Color(0xFFF5F5DC);
  static const Color blancoNitido = Color(0xFFFFFFFF);
  static const Color negroProfundo = Color(0xFF000000);
  static const Color grisSuave = Color(0xFFD3D3D3);
}

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
      appBar: AppBar(
        automaticallyImplyLeading: false, // Elimina el botón de regreso
        title: Image.asset(
          'assets/images/logotipo_largo.png', // Ruta del logo
          height: 70, // Ajusta el tamaño del logotipo
        ),
        backgroundColor: AppColors.arenaCalida, // Fondo del AppBar
        centerTitle: true, // Centra el logotipo
      ),
      body: Container(
        color: AppColors.arenaCalida, // Fondo de la app
        child: _screens[
            _currentIndex], // Cambiar la pantalla según la pestaña seleccionada
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambiar a la pantalla correspondiente
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _currentIndex == 1
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _currentIndex == 3
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Carrito',
          ),
        ],
        selectedItemColor:
            AppColors.naranjaAtardecer, // Color del ícono seleccionado
        unselectedItemColor:
            AppColors.grisSuave, // Color del ícono no seleccionado
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

// Pantalla de perfil (con botón de cerrar sesión y sin botón de regreso)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Pantalla de Perfil',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acción de cerrar sesión
              // Aquí puedes implementar lo que desees para cerrar sesión
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cerrando sesión...')),
              );
              // Simular el cierre de sesión
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Home()),
                );
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.naranjaAtardecer, // Usamos el color personalizado
            ),
            child: const Text('Cerrar sesión'),
          ),
        ],
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
