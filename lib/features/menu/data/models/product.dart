import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/domain/entity/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.category,
    required super.price,
    required super.weight,
    required super.description,
    required super.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'price': price,
        'weight': weight,
        'description': description,
        'imageUrl': imageUrl,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        category: Category.values.byName(json['category']),
        price: json['price'],
        weight: json['weight'],
        description: json['description'],
        imageUrl: json['photo_url'],
      );
}
