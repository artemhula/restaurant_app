import 'package:equatable/equatable.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
  });
  
  final int id;
  final String name;
  final Category category;
  final int price;
  final int weight;
  final String description;
  final String imageUrl;

  @override
  List<Object?> get props =>
      [id, name, category, price, weight, description, imageUrl];
}
