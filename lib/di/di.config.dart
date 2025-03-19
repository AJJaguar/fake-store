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
    as _i350;
import 'package:lyqx_test_task/features/login/data/repositories/user_repository_impl.dart'
    as _i1035;
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart'
    as _i164;
import 'package:lyqx_test_task/features/login/domain/usecases/add_user_usecase.dart'
    as _i1032;

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
    gh.lazySingleton<_i350.UserDataSource>(
        () => _i350.UserDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i164.UserRepository>(
        () => _i1035.UserRepositoryImpl(gh<_i350.UserDataSource>()));
    gh.factory<_i1032.AddUserEventUseCase>(
        () => _i1032.AddUserEventUseCase(gh<_i164.UserRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i976.NetworkModule {}
