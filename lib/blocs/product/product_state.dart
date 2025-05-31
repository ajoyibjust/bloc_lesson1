import 'package:bloc_lesson/models/product_model.dart';

sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> data;
  ProductsSuccess(this.data);
}

final class ProductsFailure extends ProductsState {
  final String error;
  ProductsFailure(this.error);
}