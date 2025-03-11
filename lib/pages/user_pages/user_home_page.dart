import 'package:caribe/components/craft_card.dart';
import 'package:caribe/pages/user_pages/user_home_screen/user_home_screen.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:caribe/pages/user_pages/user_home_screen/user_home_screen.dart';
import 'package:caribe/pages/user_pages/user_profile_screen.dart';
import 'package:caribe/pages/user_pages/user_shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:caribe/styles/app_colors.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _currentIndex = 0; // Para controlar la pestaña seleccionada

  final List<Widget> _screens = [
    UserSearchScreen(),
    UserProfileScreen(),
    UserShoppingCartScreen(),
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
        backgroundColor:
            AppColors.azulCieloTropical, // Usamos el color azulCieloTropical
        centerTitle: true, // Centra el logotipo
      ),
      body: Container(
        color: AppColors.arenaCalida, // Fondo de la app
        child: SafeArea(
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
              Icons.person,
              color: _currentIndex == 1
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _currentIndex == 2
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
