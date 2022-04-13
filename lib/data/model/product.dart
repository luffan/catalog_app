import 'package:catalog_app/data/model/category.dart';

class Product {
  final int id;
  final String title;
  final Category category;
  final num price;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      category: CategoryExt.getByName(json['category']) ?? Category.electronics,
      price: json['price'] ?? 0.0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category.apiName,
      'price': price,
      'description': description,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Product{\n'
        ' id: $id\n'
        ' title: $title\n'
        ' category: $category\n'
        ' price: $price\n'
        ' description: $description\n'
        ' image: $image\n'
        '}\n';
  }
}
