sealed class ProductsEvent {}

final class ProductsFetch extends ProductsEvent {}

final class ProductsSearch extends ProductsEvent {
  final String query;
  ProductsSearch(this.query);
}
