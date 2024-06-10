import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/cart/data/datasource/remote_datasource.dart';
import 'package:restaurant/features/cart/data/models/order.dart';
import 'package:restaurant/features/cart/domain/repository/order_repository.dart';

class OrderRepositotyImpl implements OrderRepositoty {
  OrderRepositotyImpl({required this.dataSource});
  final OrderDataSource dataSource;

  @override
  Future<Either<Failure, void>> sendOrder(order) async {
    try {
      await dataSource.postOrder(order as OrderModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
