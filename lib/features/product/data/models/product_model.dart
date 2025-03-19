import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.title,
    required super.price,
    required super.description,
    required super.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        title: map['title'],
        description: map['description'],
        price: map['price'],
        category: map['category']
      );
}
