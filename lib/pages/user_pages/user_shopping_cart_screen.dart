import 'package:caribe/components/shopping_item_card.dart';
import 'package:caribe/components/typography/section_title.dart';
import 'package:caribe/model/shopping_item_class.dart';
import 'package:flutter/material.dart';
import 'package:caribe/styles/app_colors.dart';

class UserShoppingCartScreen extends StatefulWidget {
  const UserShoppingCartScreen({super.key});

  @override
  _UserShoppingCartScreenState createState() => _UserShoppingCartScreenState();
}

class _UserShoppingCartScreenState extends State<UserShoppingCartScreen> {
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
    double totalPrice = shoppingItems.fold(
        0, (previousValue, element) => previousValue + element.getTotalPrice());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Carrito de Compras"),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: shoppingItems.length,
              itemBuilder: (context, index) {
                return ShoppingItemCard(
                  item: shoppingItems[index],
                  onRemoved: () {
                    setState(() {
                      shoppingItems.removeAt(index);
                    });
                  },
                  onMore: () {},
                  onLess: () {},
                );
              },
            ),
          ),
          // Total y botones de acción
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aquí se puede agregar lógica para el proceso de pago
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Proceso de pago en desarrollo...')),
                    );
                  },
                  child: const Text('Pagar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.naranjaAtardecer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
