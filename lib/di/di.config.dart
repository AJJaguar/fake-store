// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:lyqx_test_task/di/network_module.dart' as _i976;
import 'package:lyqx_test_task/features/login/data/datasources/user_data_source.dart'
    as _i963;
import 'package:lyqx_test_task/features/login/data/repositories/user_repository_impl.dart'
    as _i879;
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart'
    as _i720;
import 'package:lyqx_test_task/features/login/domain/usecases/add_user_usecase.dart'
    as _i203;
import 'package:lyqx_test_task/features/product/data/datasources/product_data_source.dart'
    as _i171;
import 'package:lyqx_test_task/features/product/data/repositories/user_repository_impl.dart'
    as _i788;
import 'package:lyqx_test_task/features/product/domain/repositories/product_repository.dart'
    as _i563;
import 'package:lyqx_test_task/features/product/domain/usecases/get_product_list_usecase.dart'
    as _i463;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i963.UserDataSource>(
        () => _i963.UserDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i720.UserRepository>(
        () => _i879.UserRepositoryImpl(gh<_i963.UserDataSource>()));
    gh.lazySingleton<_i171.ProductDataSource>(
        () => _i171.ProductDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i563.ProductRepository>(
        () => _i788.ProductRepositoryImpl(gh<_i171.ProductDataSource>()));
    gh.factory<_i203.AddUserEventUseCase>(
        () => _i203.AddUserEventUseCase(gh<_i720.UserRepository>()));
    gh.factory<_i463.GetProductListEventUseCase>(
        () => _i463.GetProductListEventUseCase(gh<_i563.ProductRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i976.NetworkModule {}
