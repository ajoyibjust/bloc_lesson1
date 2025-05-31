import 'dart:convert';

import 'package:bloc_lesson/models/product_model.dart';
import 'package:http/http.dart' as http;

sealed class ProductsRepository {
  Future<List<ProductModel>> fetchProduct();
}

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<List<ProductModel>> fetchProduct() async {
    try {
         final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
      headers: {"Content-Type": "application/json"},
    );
    final data = jsonDecode(response.body);
    final dataList = data as List;
    List<ProductModel> res = dataList.map((e) => ProductModel.fromMap(e),).toList();
    return res;
    } catch (e) {
      rethrow;
    }
  }
}
