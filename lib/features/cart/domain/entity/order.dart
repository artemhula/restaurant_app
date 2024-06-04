import 'package:equatable/equatable.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/cart/domain/entity/item/cart_item.dart';

class Order extends Equatable {
  const Order({
    required this.user,
    required this.cart,
    required this.address,
  });

  final UserEntity user;
  final List<CartItem> cart;
  final String address;

  @override
  List<Object?> get props => [user, cart, address];
}
