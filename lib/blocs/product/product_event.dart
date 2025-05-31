sealed class ProductsEvent {}

final class ProductsFetch extends ProductsEvent {
  final int id;
  final String name;
  ProductsFetch({required this.id, required this.name});
}

final class ProductOneFetch extends ProductsEvent {
  final int id;
  ProductOneFetch(this.id);
}

final class ProductsSearch extends ProductsEvent {
  final String query;
  ProductsSearch(this.query);
}