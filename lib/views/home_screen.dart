import 'package:bloc_lesson/blocs/product/product_bloc.dart';
import 'package:bloc_lesson/blocs/product/product_state.dart';
import 'package:bloc_lesson/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsFailure) {
            return Center(child: Text(state.error));
          } else if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: SafeArea(
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery address",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Salatiga City, Central Java",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 28,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.notifications_none,
                          size: 28,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Search()),
                          );
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Text(
                                "Recent product",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 20,
                          children: [
                            SizedBox(
                              width: 300,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                child: Image.asset("assets/images/i1.png"),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                child: Image.asset("assets/images/i1.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "Recent product",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 35,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Filters"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.77,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        final data = state.data[index];
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(data.image ?? ""),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  data.title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "\$${data.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 30,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.greenAccent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
