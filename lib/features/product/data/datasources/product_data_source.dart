import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';
import 'package:lyqx_test_task/features/product/domain/entities/product_entity.dart';

abstract class ProductDataSource {
  Future<List<ProductEntity>> getProductList();
  Future<List<ProductEntity>> getCartList();
}

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductEntity>> getProductList() async {
    try {
      Response response = await dio.get(
        'https://fakestoreapi.com/products',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      final json = response.data as List? ?? [];

      final List<ProductModel> productList =
          json.map((map) => ProductModel.fromMap(map)).toList();
      // print(productList);
      return productList;
    } catch (e) {
      print("Error getting list: $e");
      throw Exception("Failed to get product list");
    }
  }

  @override
  Future<List<ProductEntity>> getCartList() async {
    int cartNo = 1;
    try {
      Response response = await dio.get(
        // 'https://fakestoreapi.com/carts',
        'https://fakestoreapi.com/carts/$cartNo',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      final json = response.data;
      final prodList = json['products'];

      // List<ProductEntity> products = await getProductList();

      // List<ProductEntity> filteredProducts = [];

      // for (var prod in prodList) {
      //   final prodId = prod['productId'];

      //   for (var prod in products) {
      //     if (prodId == prod.id) {
      //       filteredProducts.add(prod);
      //     }
      //   }
      // }

      // final List<CartModel> convertedProdList =
      //     map.map((map) => CartModel.fromMap(map)).toList();

      return [];
    } catch (e) {
      print("Error getting list: $e");
      throw Exception("Failed to get product list");
    }
  }
}
