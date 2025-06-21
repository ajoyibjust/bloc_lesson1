import 'package:dio/dio.dart';
import 'package:bloc_lesson/models/product_model.dart';

class ProductService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await _dio.get('/products');
      final dataList = response.data as List;
      return dataList.map((e) => ProductModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception('xatolik : $e');
    }
  }
}
