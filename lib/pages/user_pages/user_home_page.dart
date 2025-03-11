import 'package:caribe/components/craft_card.dart';
import 'package:caribe/model/shopping_item_class.dart';
import 'package:caribe/pages/user_pages/user_home_screen/user_home_screen.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:caribe/pages/user_pages/user_home_screen/user_home_screen.dart';
import 'package:caribe/pages/user_pages/user_profile_screen.dart';
import 'package:caribe/pages/user_pages/user_shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:caribe/styles/app_colors.dart';
import 'package:uuid/uuid.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  var uuid = Uuid();
  int _currentIndex = 0;
  List<ShoppingItemClass> shoppingItems = [
    ShoppingItemClass(
      id: "item1",
      userId: "user1",
      craftId: "craft1",
      quantity: 2,
    ),
    ShoppingItemClass(
      id: "item2",
      userId: "user1",
      craftId: "craft2",
      quantity: 1,
    ),
    ShoppingItemClass(
      id: "item3",
      userId: "user1",
      craftId: "craft3",
      quantity: 3,
    ),
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
                  children: [
                    UserHomeScreen(
                      getShoppingItems: () => shoppingItems,
                      onItemAdded: (craftId) => {
                        setState(() {
                          shoppingItems.add(
                            ShoppingItemClass(
                              id: uuid.v4(),
                              userId: "user1",
                              craftId: craftId,
                              quantity: 1,
                            ),
                          );
                        }),
                      },
                    ),
                    UserProfileScreen(),
                    UserShoppingCartScreen(
                      getShoppingItems: () => shoppingItems,
                      onMore: (index) => setState(() {
                        int maximumQuantity = CraftClass.crafts
                            .firstWhere((element) =>
                                element.id == shoppingItems[index].craftId)
                            .quantity;
                        if (shoppingItems[index].quantity < maximumQuantity) {
                          shoppingItems[index].quantity++;
                        }
                      }),
                      onLess: (index) => setState(() {
                        if (shoppingItems[index].quantity > 1) {
                          shoppingItems[index].quantity--;
                        }
                      }),
                      makePayment: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Proceso de pago en desarrollo...')),
                        );
                        setState(() {
                          for (var shoppingItem in shoppingItems) {
                            int craftIndex = CraftClass.crafts.indexWhere(
                                (craft) => craft.id == shoppingItem.craftId);
                            CraftClass.crafts[craftIndex].quantity -=
                                shoppingItem.quantity;
                          }
                          shoppingItems.clear();
                          _currentIndex = 0;
                        });
                      },
                    ),
                  ],
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
