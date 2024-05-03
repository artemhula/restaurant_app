import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/menu/data/datasource/remote_datasource.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';
import 'package:restaurant/features/menu/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._remoteDataSource);
  final ProductRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(Category category) async {
    try {
      final products = await _remoteDataSource.fetchProducts(category.toString());
      return Right(products);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
    
  }

}