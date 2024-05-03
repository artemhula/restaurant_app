import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';
import 'package:restaurant/features/menu/domain/usecases/get_products.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getProducts) : super(ProductInitial());
  final GetProducts getProducts;

  void loadProducts(Category category) async {
    emit(ProductLoading());
    final productsOrFailure = await getProducts(category);
    productsOrFailure.fold(
        (failure) => emit(ProductFailure(message: failure.message)),
        (products) => emit(ProductLoaded(products: products)));
  }
}
