import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cart_repository.dart';

@injectable
class GetCartListEventUseCase
    implements UseCase<List<ProductEntity>, NoParams> {
  GetCartListEventUseCase(this.cartRepository);
  final CartRepository cartRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams param) {
    return cartRepository.getCartList();
  }
}
