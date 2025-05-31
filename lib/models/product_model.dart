class ProductModel {
  final num? id;
  final String? title;
  final num? price;
  final String? image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      image: map['image'],
    );
  }
}
