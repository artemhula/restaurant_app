import 'package:dartz/dartz.dart';
import 'package:restaurant/core/errors/failure.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';
import 'package:restaurant/features/menu/domain/repository/product_repository.dart';

class GetProducts{
  GetProducts({required this.productRepository});
  final ProductRepository productRepository;

  Future<Either<Failure, List<ProductEntity>>> call (Category category) async {
    return await productRepository.getProducts(category);
  }
}