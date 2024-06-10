import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/cart/domain/entity/order.dart';

abstract class OrderRepositoty {
  Future<Either<Failure, void>> sendOrder(OrderEntity order);
}