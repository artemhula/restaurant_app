import 'package:restaurant/features/auth/data/models/user.dart';
import 'package:restaurant/features/cart/data/models/cart_item.dart';
import 'package:restaurant/features/cart/domain/entity/order.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required UserModel super.user,
    required super.cart,
    required super.address,
  });

  Map<String, dynamic> toJson() => {
        'user': (user as UserModel).toJson(),
        'cart': cart.fold(
          [],
          (list, element) => list..add((element as CartItemModel).toJson()),
        ),
        'address': address,
      };
}
