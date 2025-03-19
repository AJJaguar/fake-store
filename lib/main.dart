import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyqx_test_task/app/app_router.dart';
import 'package:lyqx_test_task/di/di.dart';
import 'package:lyqx_test_task/features/login/domain/usecases/add_user_usecase.dart';

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
