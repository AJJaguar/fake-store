import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/core/usecase/usecase.dart';
import 'package:lyqx_test_task/core/usecase/usecase.dart';
import 'package:lyqx_test_task/features/cart/domain/usecases/get_cart_list_usecase.dart';
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';
import 'package:lyqx_test_task/features/product/domain/usecases/get_product_list_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
    this._getCartListEventUseCase,
  ) : super(const CartInitial()) {
    on<GetCartListEvent>(_onGetCartListEvent);
  }

  final GetCartListEventUseCase _getCartListEventUseCase;

  FutureOr<void> _onGetCartListEvent(
    GetCartListEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      const CartLoading(),
    );

    final result = await _getCartListEventUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(CartEventFailed(products: state.products, failure: failure)),
      (products) => emit(
        CartLoaded(products: products),
      ), // Use fetched products
    );
  }
}
