import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/data/models/cart_item.dart';
import 'package:restaurant/features/cart/domain/entity/item/cart_item.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartItemModel> _cart = [];

  void initCart () {
    emit(CartLoaded(cart: _cart));
  }
  
  void toggleProductInCart(ProductEntity product) {
    emit(CartLoading());
    if (_cart.any((cartItem) => cartItem.item == product)) {
      _cart.removeWhere((cartItem) => cartItem.item == product);
    } else {
      _cart.add(CartItemModel(item: product));
    }
    emit(CartLoaded(cart: _cart));
  }

  void incrementProductInCart(ProductEntity product) {
    emit(CartLoading());
    if (_cart.any((cartItem) => cartItem.item == product)) {
      _cart.firstWhere((cartItem) => cartItem.item == product).increment();
    } else {
      _cart.add(CartItemModel(item: product));
    }
    emit(CartLoaded(cart: _cart));
  }

  void decrementProductInCart(ProductEntity product) {
    emit(CartLoading());
    if (_cart.any((cartItem) => cartItem.item == product)) {
      _cart.firstWhere((cartItem) => cartItem.item == product).count - 1 == 0
          ? _cart.removeWhere((cartItem) => cartItem.item == product)
          : _cart
              .firstWhere((cartItem) => cartItem.item == product)
              .decrement();
    } else {
      _cart.add(CartItemModel(item: product));
    }
    emit(CartLoaded(cart: _cart));
  }

  void eraseCart(){
    _cart = [];
  }
}
