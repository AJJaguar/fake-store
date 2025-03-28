import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, List<ProductEntity>>> getCartList();
}
