import 'package:restaurant/features/auth/data/models/user.dart';
import 'package:restaurant/features/cart/domain/entity/order.dart';

class OrderModel extends Order {
  OrderModel({
    required UserModel super.user,
    required super.cart,
    required super.address,
  });

  Map<String, dynamic> toJson() => {
        'user': (user as UserModel).toJson(),
        'cart': cart,
        'address': address,
      };
}
