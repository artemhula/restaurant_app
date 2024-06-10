import 'package:dio/dio.dart';
import 'package:restaurant/features/cart/data/models/order.dart';
// import 'package:restaurant/utils/url.dart';

abstract class OrderDataSource {
  Future<void> postOrder(OrderModel order);
}

class OrderDataSourceImpl implements OrderDataSource {
  OrderDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> postOrder(OrderModel order) async {
      final response = await dio.post(
      // "$url/order",
      "https://jsonplaceholder.typicode.com/posts",
      data: order.toJson(),
    );
    if (response.statusCode != 201) throw Exception([response.statusCode, response.statusMessage]);

  }
}
