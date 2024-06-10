import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/cart/domain/entity/order.dart';
import 'package:restaurant/features/cart/domain/repository/order_repository.dart';

class CreateOrder {
  CreateOrder({required this.orderRepository});
  final OrderRepositoty orderRepository;

  Future<Either<Failure, void>> call(OrderEntity order) async {
    return await orderRepository.sendOrder(order);
  }
}