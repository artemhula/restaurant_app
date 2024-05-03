part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  const ProductLoaded({required this.products});
  final List<ProductEntity> products;

  @override
  List<Object> get props => [products];
}

final class ProductFailure extends ProductState {
  const ProductFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
