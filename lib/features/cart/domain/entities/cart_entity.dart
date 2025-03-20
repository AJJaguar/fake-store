import 'package:equatable/equatable.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

class CartEntity extends Equatable {
  const CartEntity({
    this.id,
    this.userId,
    this.products,
  });

  final num? id;
  final num? userId;
  final List<ProductEntity>? products;

  @override
  List<Object?> get props => [id, userId, products];
}
