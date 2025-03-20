part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class GetCartListEvent extends CartEvent {
  const GetCartListEvent();

  @override
  List<Object?> get props => [];
}
