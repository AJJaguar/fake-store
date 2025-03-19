import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/di/di.config.dart';

final gi = GetIt.instance;

@InjectableInit()
void configureDependencies() => gi.init();
