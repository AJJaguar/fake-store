import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.rating,
    required super.image,

  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        price: map['price'],
        category: map['category'],
        rating: map['rating']['rate'],
        image: map['image'],
      );
}
