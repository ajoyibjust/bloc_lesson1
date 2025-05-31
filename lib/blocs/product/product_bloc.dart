import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../repositories/products_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImpl impl;
  List<ProductModel> allProducts = [];

  ProductsBloc(this.impl) : super(ProductsLoading()) {
    on<ProductsFetch>(_onFetch);
    on<ProductsSearch>(_onSearch);
  }

  Future<void> _onFetch(ProductsFetch event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      allProducts = await impl.fetchProduct();
      emit(ProductsSuccess(allProducts));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

  void _onSearch(ProductsSearch event, Emitter<ProductsState> emit) {
    if (allProducts.isEmpty) {
      emit(ProductsSuccess([]));
      return;
    }
    if (event.query.trim().isEmpty) {
      emit(ProductsSuccess(List.from(allProducts)));
      return;
    }

    final filtered = allProducts.where((product) {
      final title = product.title?.toLowerCase() ?? '';
      final query = event.query.toLowerCase().trim();
      final contains = title.contains(query);
      return contains;
    }).toList();
    emit(ProductsSuccess(List.from(filtered)));
  }
}