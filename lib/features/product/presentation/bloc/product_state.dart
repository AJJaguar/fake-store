part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState({
    this.products,
  });
  final List<ProductEntity>? products;

  @override
  List<Object?> get props => [products];
}

class ProductInitial extends ProductState {
  const ProductInitial({super.products});
}

class ProductLoading extends ProductState {
  const ProductLoading({super.products});
}

class ProductLoaded extends ProductState {
  const ProductLoaded({super.products});
}

class ProductEventFailed extends ProductState {
  final Failure failure;
  const ProductEventFailed({
    required this.failure,
    required super.products,
  });
}
