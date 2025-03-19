import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/core/usecase/usecase.dart';
import 'package:lyqx_test_task/features/login/domain/repositories/user_repository.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

abstract class ProductDataSource {
  // Future<String> addUser(UserInfo param);
  Future<List<ProductEntity>> getProductList();
}

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({required this.dio});

  final Dio dio;

  // @override
  // Future<String> addUser(UserInfo param) async {
  //   try {
  //     // Define the user data to be sent
  //     final userData = {
  //       // "id": 0,
  //       "username": 'johnd',
  //       // "email": 'john@gmail.com',
  //       "password": 'm38rmF\$',
  //     };

  //     Response response = await dio.post(
  //       'https://fakestoreapi.com/auth/login',
  //       data: userData,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //       }),
  //     );

  //     final json = response.data;

  //     print('success');
  //     final token = json['token'].toString();
  //     print(token);
  //     return token;
  //   } catch (e) {
  //     print("Error adding user: $e");
  //     throw Exception("Failed to add user");
  //   }
  // }

  @override
  Future<List<ProductEntity>> getProductList() async {
    try {
      Response response = await dio.get(
        'https://fakestoreapi.com/products',
        // data: userData,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      final json = response.data as List? ?? [];
      // print("Response Data: ${response.data}");

      final List<ProductModel> productList =
          json.map((map) => ProductModel.fromMap(map)).toList();
      print(productList);
      return productList;
    } catch (e) {
      print("Error getting list: $e");
      throw Exception("Failed to get product list");
    }
  }
}
