import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyqx_test_task/core/error/failure.dart';
import 'package:lyqx_test_task/core/usecase/usecase.dart';
import 'package:lyqx_test_task/core/usecase/usecase.dart';
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';
import 'package:lyqx_test_task/features/product/domain/usecases/get_product_list_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
    this._getProductListEventUseCase,
  ) : super(const ProductInitial()) {
    on<GetProductListEvent>(_onGetProductListEvent);
  }

  final GetProductListEventUseCase _getProductListEventUseCase;

  FutureOr<void> _onGetProductListEvent(
    GetProductListEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      const ProductLoading(),
    );

    final result = await _getProductListEventUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(ProductEventFailed(products: state.products, failure: failure)),
      (products) =>
          emit(ProductLoaded(products: products)), // Use fetched products
    );

    // await _getProductListEventUseCase(NoParams()).then(
    //   (value) => value.fold(
    //       (failure) => emit(
    //             ProductEventFailed(products: state.products, failure: failure),
    //           ), (products) {
    //     final newState = ProductLoaded(products: products);
    //     emit(newState);
    //   }),
    // );
  }
}
