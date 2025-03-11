import 'package:caribe/model/craft_class.dart';

class ShoppingItemClass {
  final String id;
  final String userId;
  final String craftId;
  int quantity;

  ShoppingItemClass({
    required this.id,
    required this.userId,
    required this.craftId,
    required this.quantity,
  });

  CraftClass getCraft() {
    return CraftClass.crafts.firstWhere((element) => element.id == craftId);
  }

  double getTotalPrice() {
    return getCraft().price * quantity;
  }
}
