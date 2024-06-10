import 'package:restaurant/features/cart/domain/entity/item/cart_item.dart';
import 'package:restaurant/features/menu/data/models/product.dart';

class CartItemModel extends CartItem {
  CartItemModel({required super.item});

  void increment() {
    super.count++;
  }

  void decrement() {
    super.count--;
  }

  Map<String, dynamic> toJson() => {
        'product': (super.item as ProductModel).toJson(),
        'count': count,
      };
}
