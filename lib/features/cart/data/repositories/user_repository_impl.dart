import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:lyqx_test_task/features/product/data/datasources/product_data_source.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl(this.dataSource);

  final ProductDataSource dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getCartList() async {
    try {
      final cartList = await dataSource.getCartList();
      return Right(cartList);
    } catch (e) {
      return const Left(
        LoginFailure('Failed to load data'),
      );
    }
  }
}
