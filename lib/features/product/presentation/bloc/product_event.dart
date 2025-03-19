part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductListEvent extends ProductEvent {
  const GetProductListEvent();

  @override
  List<Object?> get props => [];
}
