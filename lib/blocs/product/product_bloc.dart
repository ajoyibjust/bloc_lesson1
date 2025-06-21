import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../repositories/products_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository repository;
  List<ProductModel> _allProducts = [];

  ProductsBloc(this.repository) : super(ProductsLoading()) {
    on<ProductsFetch>(_onFetch);
    on<ProductsSearch>(_onSearch);
  }

  Future<void> _onFetch(ProductsFetch event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      _allProducts = await repository.getAllProducts();
      emit(ProductsSuccess(_allProducts));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

  void _onSearch(ProductsSearch event, Emitter<ProductsState> emit) {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(ProductsSuccess(_allProducts));
      return;
    }

    final filtered = _allProducts.where((product) {
      final title = product.title?.toLowerCase() ?? '';
      return title.contains(query);
    }).toList();

    emit(ProductsSuccess(filtered));
  }
}
