import 'package:dio/dio.dart';
import 'package:restaurant/features/menu/data/models/product.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';
import 'package:restaurant/utils/url.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> fetchProducts(String category);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ProductEntity>> fetchProducts(String category) async {
    final response = await dio.get<List<Map<String, dynamic>>>("$url/items/$category");
    if (response.statusCode == 200) {
      final data = response.data!;
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return products;
    }
    throw Exception();
  }

}