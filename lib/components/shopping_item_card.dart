import 'package:caribe/components/labeled_value.dart';
import 'package:caribe/model/shopping_item_class.dart';
import 'package:flutter/material.dart';

class ShoppingItemCard extends StatelessWidget {
  final ShoppingItemClass item;
  final void Function()? onRemoved;
  final void Function()? onMore;
  final void Function()? onLess;

  const ShoppingItemCard({
    super.key,
    required this.item,
    required this.onRemoved,
    required this.onMore,
    required this.onLess,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              item.getCraft().imageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.getCraft().title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        LabeledValue(
                          label: "Cantidad",
                          value: "${item.quantity}",
                        ),
                        SizedBox(width: 8),
                        LabeledValue(
                          label: "Precio Unitario",
                          value: "\$${item.getCraft().price}",
                        ),
                        SizedBox(width: 8),
                        LabeledValue(
                          label: "Subtotal",
                          value: "\$${item.getTotalPrice()}",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Column(
            children: [
              IconButton(
                onPressed: onMore,
                icon: Icon(Icons.arrow_upward_rounded),
              ),
              IconButton(
                onPressed: onLess,
                icon: Icon(Icons.arrow_downward_rounded),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onRemoved,
          ),
        ],
      ),
    );
  }
}
