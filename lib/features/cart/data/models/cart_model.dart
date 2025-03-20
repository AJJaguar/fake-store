import 'package:lyqx_test_task/features/cart/domain/entities/cart_entity.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

class CartModel extends CartEntity {
  const CartModel({super.id, super.userId, super.products});

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
        id: map['id'],
        userId: map['userId'],
        products: map['products'],
      );
}
