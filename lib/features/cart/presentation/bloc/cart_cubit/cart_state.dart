part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  const CartLoaded({required this.cart});
  final List<CartItem> cart;

  @override
  List<Object> get props => [cart];
}
