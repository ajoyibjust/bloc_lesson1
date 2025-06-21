import 'package:bloc_lesson/models/product_model.dart';
import 'package:bloc_lesson/services/product_service.dart';

class ProductsRepository {
  final ProductService productService;

  ProductsRepository(this.productService);

  Future<List<ProductModel>> getAllProducts() {
    return productService.fetchProduct();
  }
}
