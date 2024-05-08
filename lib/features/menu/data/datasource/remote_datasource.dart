import 'package:dio/dio.dart';
import 'package:restaurant/features/menu/data/models/product.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';
import 'package:restaurant/utils/url.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final response = await dio.get("$url/items");
    if (response.statusCode == 200) {
      final data = response.data as List;
      final products = data.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
      return products;
    }
    throw Exception();
  }
}