import 'package:restaurant/features/cart/domain/entity/item/cart_item.dart';

class CartItemModel extends CartItem {
  CartItemModel({required super.item});

  void increment() {
    super.count++;
  }
  void decrement() {
    super.count--;
  }
}