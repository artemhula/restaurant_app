import 'package:restaurant/features/menu/domain/entity/product.dart';

class CartItem {
  CartItem({required this.item}) : count = 1;
  final ProductEntity item;
  int count;
}
