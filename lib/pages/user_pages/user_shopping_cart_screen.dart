import 'package:caribe/components/iconic_button.dart';
import 'package:caribe/components/shopping_item_card.dart';
import 'package:caribe/components/typography/section_title.dart';
import 'package:caribe/model/shopping_item_class.dart';
import 'package:flutter/material.dart';
import 'package:caribe/styles/app_colors.dart';

class UserShoppingCartScreen extends StatefulWidget {
  List<ShoppingItemClass> Function() getShoppingItems;
  void Function(int index) onMore;
  void Function(int index) onLess;
  void Function() makePayment;

  UserShoppingCartScreen({
    super.key,
    required this.getShoppingItems,
    required this.onMore,
    required this.onLess,
    required this.makePayment,
  });

  @override
  _UserShoppingCartScreenState createState() => _UserShoppingCartScreenState();
}

class _UserShoppingCartScreenState extends State<UserShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.getShoppingItems().fold(
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
              itemCount: widget.getShoppingItems().length,
              itemBuilder: (context, index) {
                return ShoppingItemCard(
                  item: widget.getShoppingItems()[index],
                  onRemoved: () {
                    setState(() {
                      widget.getShoppingItems().removeAt(index);
                    });
                  },
                  onMore: () => widget.onMore(index),
                  onLess: () => widget.onLess(index),
                );
              },
            ),
          ),
          // Total y botones de acción
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                IconicButton(
                  label: "Pagar",
                  icon: Icons.payment,
                  onPressed: widget.makePayment,
                  isEnabled: widget.getShoppingItems().isNotEmpty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
