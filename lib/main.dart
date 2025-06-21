import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_lesson/blocs/product/product_bloc.dart';
import 'package:bloc_lesson/blocs/product/product_event.dart';
import 'package:bloc_lesson/repositories/products_repository.dart';
import 'package:bloc_lesson/services/product_service.dart';
import 'package:bloc_lesson/views/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();
    final productsRepository = ProductsRepository(productService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(productsRepository)..add(ProductsFetch()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
