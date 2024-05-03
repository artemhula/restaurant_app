import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts(Category category);
}