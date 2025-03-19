import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/features/login/domain/entities/user_entity.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/product_repository.dart';

@injectable
class GetProductListEventUseCase
    implements UseCase<List<ProductEntity>, NoParams> {
  GetProductListEventUseCase(this.productRepository);
  final ProductRepository productRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams param) {
    return productRepository.getProductList();
  }
}
