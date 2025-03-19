import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/features/product/data/datasources/product_data_source.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';
import 'package:lyqx_test_task/features/product/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this.dataSource);

  final ProductDataSource dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() async {
    try {
      final productList = await dataSource.getProductList();
      return Right(productList);
    } catch (e) {
      return const Left(
        LoginFailure('Failed to load data'),
      );
    }
  }
}
