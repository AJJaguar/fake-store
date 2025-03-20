part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState({
    this.products,
  });
  final List<ProductEntity>? products;

  @override
  List<Object?> get props => [products];
}

class CartInitial extends CartState {
  const CartInitial({super.products});
}

class CartLoading extends CartState {
  const CartLoading({super.products});
}

class CartLoaded extends CartState {
  const CartLoaded({super.products});
}

class CartEventFailed extends CartState {
  final Failure failure;
  const CartEventFailed({
    required this.failure,
    required super.products,
  });
}
