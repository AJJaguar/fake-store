import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart';

abstract class UserDataSource {
  Future<String> addUser(UserInfo param);
}

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<String> addUser(UserInfo param) async {
    try {
      // Define the user data to be sent
      final userData = {
        // "id": 0,
        "username": 'johnd',
        // "email": 'john@gmail.com',
        "password": 'm38rmF\$',
      };

      Response response = await dio.post(
        'https://fakestoreapi.com/auth/login',
        data: userData,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      final json = response.data;

      print('success');
      final token = json['token'].toString();
      print(token);
      return token;
    } catch (e) {
      print("Error adding user: $e");
      throw Exception("Failed to add user");
    }
  }
}
