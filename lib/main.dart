import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyqx_test_task/app/app_router.dart';
import 'package:lyqx_test_task/di/di.dart';
import 'package:lyqx_test_task/features/cart/domain/usecases/get_cart_list_usecase.dart';
import 'package:lyqx_test_task/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lyqx_test_task/features/login/domain/usecases/add_user_usecase.dart';
import 'package:lyqx_test_task/features/product/domain/usecases/get_product_list_usecase.dart';
import 'package:lyqx_test_task/features/product/presentation/bloc/product_bloc.dart';

import 'features/login/presentation/bloc/login_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            gi<AddUserEventUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            gi<GetProductListEventUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            gi<GetCartListEventUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Fake Store',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
